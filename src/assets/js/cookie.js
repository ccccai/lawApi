/*用export把方法暴露出来*/
/*设置cookie*/
export function setCookie(name, value)//两个参数，一个是cookie的名子，一个是值
{
    var Days = 10; //此 cookie 将被保存 1 天
    var exp = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}
/*获取cookie*/
export function getCookie(name)//取cookies函数
{
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) return (arr[2]);
    return null;

}
/*删除cookie*/
export function delCookie(name)//删除cookie
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    console.log(cval);
    if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}
