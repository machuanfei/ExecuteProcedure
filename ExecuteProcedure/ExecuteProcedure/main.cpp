#include <iostream>
#include "MysqlConnectHelper.h"
#include <time.h>


int main()
{
	// 连接数据库
	CMysqlConnectHelper mysqlHelper;
	if (!mysqlHelper.ConnectDB("root", "123456", "X5004_CenterDb", "localhost", 3306))
	{
		printf("mysql_real_connect() failed!/n");
		mysqlHelper.CloseMysql();
		system("pause");
		return 0;
	}
	


	// 执行存储过程

	time_t nProcedureTime = 0;
	time_t nProcedureEndTime = 0;
	for (int i = 0; i < 2000; ++i )
	{
		nProcedureTime = 0;
		nProcedureEndTime = 0;

		nProcedureTime = GetTickCount();
		char query[256] = { 0 };
		std::sprintf(query, "call PrGs_Center_AccountLoginV3 ('%s', %d, %d, %d, '%s', %lld, '%s' , '%s' ,'%s' ,'%s' ,'%s' )",
			"chxx1", 0, 0, 0, "", time(NULL), "", "", "", "", "");
		std::string stQuery = query;
		int nRet = mysqlHelper.ExecuteProcedure(stQuery.c_str(), stQuery.length());
		if (nRet)
		{
			system("pause");
			continue;
		}
		nProcedureEndTime = GetTickCount();

		time_t difTime = nProcedureEndTime - nProcedureTime;
		
		if (difTime)
		{
			printf("Time before execution = %lld,  Time after execution = %lld\n", nProcedureTime, nProcedureEndTime);
			printf("********************************\n********************************\n********************************\n time is long execution time = %lld\n", difTime);
		}
		//else
		//{
		//	printf("Time before execution = %lld,  Time after execution = %lld\n", nProcedureTime, nProcedureEndTime);
		//	printf("execution time = %lld\n", difTime);
		//}
		


		time_t nBeginTime = GetTickCount();
		mysqlHelper.readAllResult();
		
		Sleep(100);
	}
	
	



	//// 打印返回结果
	//MYSQL_ROW record = mysqlHelper.GetMysqlFetchRow();
	//if (record != NULL )
	//{
	//	printf("[%s]-[%s]-[%s]\n", record[0], record[1], record[3]);
	//}

	system("pause");
	return 0;
}
