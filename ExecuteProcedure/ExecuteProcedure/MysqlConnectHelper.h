#pragma once
#include <winsock.h>
#include "include/mysql.h"

class CMysqlConnectHelper
{
public:
	CMysqlConnectHelper();
	~CMysqlConnectHelper();

	bool ConnectDB(const char* user,const char* passwd,const char* db, const char* host = 0, unsigned int port = 0);

	int ExecuteProcedure(const char* pProcedure, int nLen);

	MYSQL_FIELD* GetMysqlFetchField();
	int MysqlFetchLengths();

	MYSQL_ROW GetMysqlFetchRow();

	void CloseMysql();

	void ClearResult();

	void readAllResult();
private:
	MYSQL mysql;
	MYSQL_RES* results;
};
