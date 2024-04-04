CC = gcc
CXX = g++
BUILD_DIR = build
SRC_DIR = src
IMAGE_TAG = your_image_tag

# Default target
default: linux

linux:
	mkdir -p $(BUILD_DIR)/linux
	$(CXX) -o $(BUILD_DIR)/linux/your_program $(SRC_DIR)/*.cpp

arm:
	mkdir -p $(BUILD_DIR)/arm
	$(CXX) -o $(BUILD_DIR)/arm/your_program $(SRC_DIR)/*.cpp

macos:
	mkdir -p $(BUILD_DIR)/macos
	$(CXX) -o $(BUILD_DIR)/macos/your_program $(SRC_DIR)/*.cpp

windows:
	mkdir -p $(BUILD_DIR)/windows
	$(CXX) -o $(BUILD_DIR)/windows/your_program.exe $(SRC_DIR)/*.cpp

clean:
	rm -rf $(BUILD_DIR)
	docker rmi $(IMAGE_TAG)
