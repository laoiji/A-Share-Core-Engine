# compile_proto.sh (最终修正版本)
# ----------------------------------------------------

# 1. 定义路径变量
# PROTO_DIR 指向包含所有 .proto 文件的目录
PROTO_DIR="./BacktestSystem-Protocol" 
OUTPUT_DIR="./core/interfaces"

mkdir -p ${OUTPUT_DIR}

echo "Starting Protobuf compilation..."

# 2. 运行 Protobuf 编译器
# 移除所有对 /proto 的引用！
protoc -I=${PROTO_DIR} \
    --python_out=${OUTPUT_DIR} \
    --grpc_python_out=${OUTPUT_DIR} \
    ${PROTO_DIR}/*.proto  # 直接引用 ${PROTO_DIR} 下的所有 .proto 文件

echo "Protobuf compilation successful! Files are in ${OUTPUT_DIR}"
