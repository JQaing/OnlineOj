package ConstantUtils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

public class OnlineUtils {
	public void save(String code) throws Exception
	{
		File file = new File(FinalUtils.file, "online.java");
		OutputStream out = new FileOutputStream(file);
		byte[] b = code.getBytes();
		out.write(b);
		out.close();
	}
	
	public String print(InputStream inputStream) throws Exception
	{
		InputStreamReader inr = new InputStreamReader(inputStream);
		BufferedReader bfr = new BufferedReader(inr);
		StringBuffer stb = new StringBuffer();
		String line = bfr.readLine();
		while(line != null)
		{
			stb.append(line+"\n");
			line = bfr.readLine();
		}
		inr.close();
		bfr.close();
		return stb.toString();
	}
	
}
