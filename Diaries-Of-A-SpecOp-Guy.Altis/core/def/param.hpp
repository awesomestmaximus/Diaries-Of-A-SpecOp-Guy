class Params {
	class p_title_template {
	//paramsArray[0]
		title = "<< -----------------		DEBUG		----------------- >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class p_time {
	//paramsArray[1]
		title = "			<ENABLED?!>:";
		values[]={0,1};
		texts[]={"NO","YES"};
		default = 1;
	};
	class p_title_spacer_1 {
	//paramsArray[2]
		title = "<< -----------------	Radio Jammer	----------------- >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class p_jam_Radius {
	//paramsArray[3]
		title = "			Jammer Radius:";
		values[]={2500, 5000, 7500, 10000, 12500, 15000};
		texts[]={" 2.5 km", " 5.0 km", " 7.5 km", "10.0 km", "12.5 km", "15.0 km"};
		default = 5000;
	};
};
