	package com.service;

import ConstantUtils.FinalUtils;
import ConstantUtils.OnlineUtils;

public class ComplierService {
	
	public String complier(String code) throws Exception{
		OnlineUtils online = new OnlineUtils();
		//保存文件
		online.save(code);
		//编译
		Runtime run = Runtime.getRuntime();
		Process compilePro = run.exec(FinalUtils.compile, null, FinalUtils.file);
		compilePro.waitFor();
		if(compilePro.exitValue() == 0)
		{
			Process coderunPro = run.exec(FinalUtils.coderun, null, FinalUtils.file);
			if(coderunPro.getErrorStream().read() != -1)
				return online.print(coderunPro.getErrorStream());
			return online.print(coderunPro.getInputStream());
		}
		return online.print(compilePro.getErrorStream());
	}
}
