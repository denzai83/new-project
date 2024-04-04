# Dockerfile for testing on different platforms
# Base image from quay.io

# Base image
FROM quay.io/projectquay/golang:1.20 AS builder

# Install any additional dependencies needed for your build

# Copy your source code
COPY . /app
WORKDIR /app

# Build for Linux
RUN mkdir -p build/linux && \
    GOOS=linux GOARCH=amd64 go build -o build/linux/your_program .

# Build for arm
RUN mkdir -p build/arm && \
    GOOS=linux GOARCH=arm go build -o build/arm/your_program .

# Build for macOS
RUN mkdir -p build/macos && \
    GOOS=darwin GOARCH=amd64 go build -o build/macos/your_program .

# Build for Windows
RUN mkdir -p build/windows && \
    GOOS=windows GOARCH=amd64 go build -o build/windows/your_program.exe .

# You can add test commands here

# Final stage
FROM scratch
COPY --from=builder /app/build/linux/your_program /your_program_linux
COPY --from=builder /app/build/arm/your_program /your_program_arm
COPY --from=builder /app/build/macos/your_program /your_program_macos
COPY --from=builder /app/build/windows/your_program.exe /your_program_windows
