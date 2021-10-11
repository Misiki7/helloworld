
# ARM64
#FROM harbor.dev.wh.digitalchina.com/lib/openjdk8:arm64

# x86
FROM harbor.dev.wh.digitalchina.com/library/openjdk:8-jdk-buster
#FROM openjdk:8-jdk
#拷贝文件并且重命名
ADD target/hello-world-1.0.0.jar app.jar

#暴露容器端口，Docker镜像告知Docker宿主机应用监听了哪个端口
EXPOSE 8080
#容器启动时执行的命令
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app.jar $PARAMS"]