c++ 调用 mysql c api的实例
这里进行了一个简单的封装， CMysqlConnectHelper 类里包含了基本的操作
1、连接数据库  
bool ConnectDB(const char* user,const char* passwd,const char* db, const char* host = 0, unsigned int port = 0);
2、执行存储过程
int ExecuteProcedure(const char* pProcedure, int nLen);
