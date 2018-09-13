#include <iostream>
#include "MysqlConnectHelper.h"

CMysqlConnectHelper::CMysqlConnectHelper()
{
	if (!mysql_init(&mysql))
	{
		printf("mysql_init failed!/n");
		return;
	}
}

CMysqlConnectHelper::~CMysqlConnectHelper()
{
	CloseMysql();
}

bool CMysqlConnectHelper::ConnectDB(const char* user, const char* passwd, const char* db, const char* host, unsigned int port)
{
	if (!mysql_real_connect(&mysql, host, user, passwd, db, port, NULL, CLIENT_MULTI_STATEMENTS))
	{
		printf("mysql_real_connect() failed: %s\n", mysql_error(&mysql));
		mysql_close(&mysql);
		return false;
	}
	return true;
}

int CMysqlConnectHelper::ExecuteProcedure(const char* pProcedure, int nLen)
{
	ClearResult();

	int nRet = mysql_real_query(&mysql, pProcedure, nLen);
	if (nRet)
	{
		printf("Error exec query: %s\n", mysql_error(&mysql));
	}
	else
	{
		//printf("[%s] exec...\n", pProcedure);
	}
	results = mysql_store_result(&mysql);
	return nRet;
}

MYSQL_FIELD* CMysqlConnectHelper::GetMysqlFetchField()
{
	return mysql_fetch_field(results);
}

int CMysqlConnectHelper::MysqlFetchLengths()
{
	unsigned long * pLen = mysql_fetch_lengths(results);
	if (pLen == NULL )
	{
		return 0;
	}
	return *pLen;
}

MYSQL_ROW CMysqlConnectHelper::GetMysqlFetchRow()
{
	return mysql_fetch_row(results);
}

void CMysqlConnectHelper::CloseMysql()
{
	mysql_free_result(results);
	mysql_close(&mysql);
}

void CMysqlConnectHelper::ClearResult()
{
	mysql_free_result(results);
	
	//time_t nBeginTime = GetTickCount();
	
	//do
	//{
	//	MYSQL_RES* res = mysql_store_result(&mysql);
	//	mysql_free_result(res);
	//} while ((0 == mysql_next_result(&mysql)));
	//time_t nEndTime = GetTickCount();
	//time_t difTime = nEndTime - nBeginTime;
	//if (difTime)
	//{
	//	printf("CMysqlConnectHelper::ClearResult expend time = %lld\n", difTime);
	//}
}

void CMysqlConnectHelper::readAllResult()
{
	time_t nBeginTime = GetTickCount();

	do
	{
		MYSQL_RES* res = mysql_store_result(&mysql);
		mysql_free_result(res);
	} while ((0 == mysql_next_result(&mysql)));
	time_t nEndTime = GetTickCount();
	time_t difTime = nEndTime - nBeginTime;
	if (difTime)
	{
		//printf("CMysqlConnectHelper::ClearResult expend time = %lld\n", difTime);
	}
}