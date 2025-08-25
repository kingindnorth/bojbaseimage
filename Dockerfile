#Stage 1 - Install dependencies and build the app
FROM debian:12.8 AS build-env



# Install flutter dependencies
RUN apt-get update && \
    apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3 && \
    apt-get clean

# Clone the flutter repo
#RUN git clone --branch 3.27.0 https://github.com/flutter/flutter.git /usr/local/flutter
RUN git clone --branch 3.32.8 https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter clean
RUN flutter pub get