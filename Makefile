BIN = ion
SRC_DIR = core
BUILD_DIR = build
SRC_FILES = $(wildcard $(SRC_DIR)/*.m)
HEADER_FILES = $(wildcard $(SRC_DIR)/*.h)

CC = clang
CFLAGS = -Wall -Werror -Wextra -fobjc-arc -framework Foundation -framework JavaScriptCore -I${SRC_DIR}

all: build

build: $(BIN)

$(BIN): $(SRC_FILES) $(HEADER_FILES)
	mkdir -p ${BUILD_DIR}
	${CC} ${CFLAGS} -o ${BUILD_DIR}/${BIN} ${SRC_FILES}

repl: build
	./${BUILD_DIR}/${BIN}

clean:
	rm -f ${BUILD_DIR}/${BIN}