.PHONY: all build run clean

BIN = jsc
SRC_DIR = src
SRC_FILES = $(wildcard $(SRC_DIR)/*.m)
CC = clang
CFLAGS = -Wall -Werror -Wextra -fobjc-arc -framework Foundation -framework JavaScriptCore
BUILD_DIR = build

all: build

build: $(BIN)

$(BIN): $(SRC_FILES)
	mkdir -p ${BUILD_DIR}
	${CC} ${CFLAGS} -o ${BUILD_DIR}/${BIN} ${SRC_FILES}

run: build
	./${BUILD_DIR}/${BIN}

clean:
	rm -f ${BUILD_DIR}/${BIN}
