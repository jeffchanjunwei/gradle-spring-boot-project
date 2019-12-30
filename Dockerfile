FROM hub.c.163.com/qingzhou/jdk8-openjdk-skiff:v1.2-191015

ADD build/libs/*.jar app.jar
CMD exec java $JAVA_OPTS \
    -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap \
    -Djava.security.egd=file:/dev/./urandom \
    -Djava.library.path=/ \
    #这里是为了svnkit能够连接https协议的仓库
    -Djsse.enableSNIExtension=false \
    -jar /app.jar $APP_ARGS
