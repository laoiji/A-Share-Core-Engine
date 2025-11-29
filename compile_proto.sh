# compile_proto.sh (修正后的版本)
# ----------------------------------------------------

# 1. 确保协议仓库已存在（您需要手动克隆或使用git submodule）
# 修正路径：现在协议仓库位于当前目录下的 BacktestSystem-Protocol 文件夹
PROTO_DIR="./BacktestSystem-Protocol" 
OUTPUT_DIR="./core/interfaces"

mkdir -p ${OUTPUT_DIR}

# 2. 运行 Protobuf 编译器
# --proto_path: 指明 .proto 文件在哪里
# --python_out: 生成 Python 消息类
# --grpc_python_out: 生成 gRPC 客户端/服务端 stub
protoc -I=${PROTO_DIR}/proto \
    --python_out=${OUTPUT_DIR} \
    --grpc_python_out=${OUTPUT_DIR} \
    ${PROTO_DIR}/proto/*.proto

echo "Protobuf files compiled successfully into ${OUTPUT_DIR}"
