#!/usr/bin/bash.exe
curl -s "http://www.weather.com.cn/data/cityinfo/101221201.html" -o weather.json
cat weather.json | awk  -F "[\",:]+" '{
	for(i = 0; i < NF; i ++)
	{
		if($i=="city")
			mycity= $(i+1)
		else if($i == "temp1")
			templow = $(i+1)
		else if($i == "temp2")
			temphigh = $(i+1)
		else if($i == "weather")
			mycityweather = $(i+1)
	}
}
END{
	printf("城市:%s, 天气:%s, 温度:%s~%s\n",mycity,mycityweather,templow,temphigh)
} '
