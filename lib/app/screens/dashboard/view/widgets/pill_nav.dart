import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PillNav extends StatelessWidget {
  final double height;
  final Color bg;
  final Color text;
  final Color indicator;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const PillNav({
    super.key,
    required this.height,
    required this.bg,
    required this.text,
    required this.indicator,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      height: height,
      margin:  EdgeInsets.symmetric(horizontal: 16.w),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8.r),
        // no border, no shadow
      ),
      alignment: Alignment.centerLeft,
      child: _TopTabs(
        textColor: text,
        indicatorColor: indicator,
        selectedIndex: selectedIndex,
        onTabSelected: onTabSelected,
      ),
    );
  }
}

class _TopTabs extends StatelessWidget {
  final Color textColor;
  final Color indicatorColor;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const _TopTabs({
    required this.textColor,
    required this.indicatorColor,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = <_TabItem>[
      _TabItem('tab_insurance'.tr, ['Health', 'Term', 'ULIP']),
      _TabItem('tab_claims'.tr, ['File a claim', 'Track claim']),

      _TabItem('tab_wellness'.tr, ['Programs', 'Rewards']),
      _TabItem('tab_knowledge'.tr, ['Articles', 'FAQs']),
      _TabItem('tab_about'.tr, []),
      _TabItem('tab_careers'.tr, ['Open roles', 'Life @Pru']),
      _TabItem('tab_contact'.tr, []),


    ];

    return Padding(
      padding:  EdgeInsets.only(left:125.0,right: 125),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding:  EdgeInsets.symmetric(horizontal: 16.h),
        itemCount: tabs.length,
        separatorBuilder: (_, __) =>  SizedBox(width: 16.w),
        itemBuilder: (context, i) {
          final t = tabs[i];
          return _DropdownTab(
            label: t.label,
            items: t.items,
            textColor: textColor,
            indicatorColor: indicatorColor,
            isActive: selectedIndex == i,
            onTap: () => onTabSelected(i),
            onSelect: (v) {
              onTabSelected(i);
              Get.snackbar('snack_selected'.tr, '${t.label} → $v',
                  snackPosition: SnackPosition.BOTTOM);
            },
          );
        },
      ),
    );
  }
}

class _DropdownTab extends StatefulWidget {
  final String label;
  final List<String> items;
  final Color textColor;
  final Color indicatorColor;
  final bool isActive;
  final VoidCallback onTap;
  final ValueChanged<String>? onSelect;

  const _DropdownTab({
    required this.label,
    required this.items,
    required this.textColor,
    required this.indicatorColor,
    required this.isActive,
    required this.onTap,
    this.onSelect,
  });

  @override
  State<_DropdownTab> createState() => _DropdownTabState();
}

class _DropdownTabState extends State<_DropdownTab> {
  final GlobalKey _tabKey = GlobalKey();
  double? _tabWidth;
  bool _open = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _measureTabWidth();
  }

  @override
  void didUpdateWidget(covariant _DropdownTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    _measureTabWidth();
  }

  void _measureTabWidth() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _tabKey.currentContext;
      if (ctx == null) return;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) return;
      final w = box.size.width;
      if (w != _tabWidth) setState(() => _tabWidth = w);
    });
  }

  double _measureContentWidth(BuildContext context) {
    if (widget.items.isEmpty) return 0;
    final textStyle = Theme.of(context).textTheme.bodyMedium!;
    double maxW = 0;
    for (final s in widget.items) {
      final tp = TextPainter(
        text: TextSpan(text: s, style: textStyle),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      )..layout();
      maxW = maxW < tp.width ? tp.width : maxW;
    }
    return maxW + 32;
  }

  Widget _buildTabContent() {
    return Container(
      key: _tabKey,
      padding:  EdgeInsets.fromLTRB(12.w, 0, 12.w, 8.h),
      height: 56.h,
      decoration: BoxDecoration(
        border: (widget.isActive || _open)
            ? Border(bottom: BorderSide(color: widget.indicatorColor, width: 4.w))
            : null,
      ),
      child: Row(
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontWeight:
              (widget.isActive || _open) ? FontWeight.w700 : FontWeight.w600,
              color: widget.textColor,
            ),
          ),
          if (widget.items.isNotEmpty) ...[
             SizedBox(width: 6.w),
            Icon(Icons.keyboard_arrow_down, size: 18.w, color: widget.textColor),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return InkWell(onTap: widget.onTap, child: _buildTabContent());
    }

    final contentWidth = _measureContentWidth(context);
    final targetWidth =
    (_tabWidth ?? 0) > contentWidth ? (_tabWidth ?? 0) : contentWidth;

    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      offset: const Offset(0, 8),
      color: Colors.white,
      constraints: (targetWidth > 0)
          ? BoxConstraints.tightFor(width: targetWidth)
          : const BoxConstraints(minWidth: 160, maxWidth: 320),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onOpened: () {
        setState(() => _open = true);
        widget.onTap();
      },
      onCanceled: () => setState(() => _open = false),
      onSelected: (v) {
        setState(() => _open = false);
        widget.onSelect?.call(v);
      },
      itemBuilder: (_) => [
        for (final e in widget.items)
          PopupMenuItem<String>(
            value: e,
            child: Text(e, style: const TextStyle(color: Colors.black)),
          ),
      ],
      child: _buildTabContent(),
    );
  }
}

class _TabItem {
  final String label;
  final List<String> items;
  const _TabItem(this.label, this.items);
}
