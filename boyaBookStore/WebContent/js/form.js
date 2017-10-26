/**
 * jsValidate.js is used to validate the Input on Form
 */

/**
 * formIsNull方法：判断相应的input表单是否为空
 * 为空则返回false，表单不提交，并将errDiv的值变为errStr，例如将Span的值变为"邮箱不能为空！".不为空则返回true.
 * @param goalDiv 要验证的input表单的name值.
 * @param errDiv 如果验证通不过，则需要改变的div的Id.
 * @param errStr 在errDiv内显示的文字. 如："邮箱不能为空"
 * @returns {Boolean}. true：验证通过; false：验证未通过.
 */
function formIsNull(goalDiv, errDiv, errStr)
{
document.getElementById(errDiv).innerHTML = "";
var temp = document.getElementsByName(goalDiv)[0].value.trim();
if (temp != "") {
return true;
} else {
document.getElementById(errDiv).innerHTML = errStr;
return false;
}
}

/**
 * rightRuly方法：利用正则表达式，判断输入input的内容是否合法.
 * @param Ruly ：正则表达式 的字符串形式
 * @param goalDiv ：Input输入框的name值
 * @param errDiv ：验证不合法时，需要显示错误信息的div的Id值
 * @param errStr ： 验证不合法是显示的内容
 * @returns {Boolean}. true：验证通过; false：验证未通过.
 */
function rightRuly(Ruly, goalDiv, errDiv, errStr){
// var reg = new RegExp(Ruly);
var reg = eval(Ruly);
var temp = document.getElementsByName(goalDiv)[0].value.trim();
if(reg.test(temp)){
return true;
} else {
document.getElementById(errDiv).innerHTML = errStr;
return false;
}
}

/**
 * 判断两个输入框是否相同，常用语判断密码和确认密码是否相同
 * @param goal01 input目标1的name值
 * @param goal02 input目标2的Id值
 * @param errDiv 验证错误时，显示错误消息的元素标签
 * @param errStr 验证错误时的错误信息
 * @returns {Boolean} 相同时返回true，不同是返回false且在Id为errDiv的标签内显示错误消息errStr
 * Tips：注意 goal01为name值，goal02为Id值.   这样做的原因：表单提交时不提交Id，所以可以减少流量。
 */
function isEqual(goal01, goal02, errDiv, errStr){
var g1 = document.getElementsByName(goal01)[0].value.trim();
var g2 = document.getElementById(goal02).value.trim();
if(g1==g2){
return true;
} else {
document.getElementById(errDiv).innerHTML = errStr;
return false;
}
}