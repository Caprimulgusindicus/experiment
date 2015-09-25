#include<iostream>
#include <stack>
#include<string.h>
#include<math.h>
#include<ctype.h>
#include<stdio.h>
#include "SSS.h"//手写的栈
using namespace std;
int i,j,start,node,end;
int newc;
char str[100];
int c1=0,c2=0,s1=1,s2=1,s3=1,s4=1;

class calculator
{public:
        void evaluate();//根据优先级计算
        bool clear();
 private:
        stack<char>optr;//建立操作符栈
        stack<double>opnd;//建立数字栈
        int lp(char op);//左运算符优先级
        int rp(char op);//右运算符优先级
        double operate(char theta, double a, double b);//进行栈操作
};

double calculator::operate(char theta, double a, double b)//当满足其他条件时，才会进入运算
{
    switch(theta)
    {
        case '+':return a+b;
        case '-':return b-a;
        case '*':return a*b;
        case '/':return b/a;
    }
}

int calculator::lp(char op)//由课件可判定每一个的优先级
{
    switch(op)
    {
    case '+': return 2;
    case '-': return 2;
	case '*': return 4;
    case '/': return 4;
	case '(': return 6;
	case ')': return 1;
    default: return 0;
    }
}

int calculator::rp(char op)//有课件可判断出每一个的优先级
{
   	switch(op)
   	{
   	    case '+':case '-': return 3;
        case '*':case '/':  return 5;
        case '(':  return 1;
        case ')': return 6;
        default: 	return 0;
    }
}

bool calculator::clear()//判断是否满足进行运算的条件
{
 cin>>str;
 for(i=0,j=0;str[i]!='\0';i++,j++)
 {
     if(str[i]=='(') c1++;
     if(str[i]==')') c2++;
 }

 if(c1==c2)
 {
     for(i=0,j=1;str[j]!='\0';i++,j++)
    {
        if((str[i]==')' && str[j]=='(') ||((str[i]=='(' && str[j]==')'))|| (str[i]>=42 && str[i]<=47 && str[j]>=42 && str[j]<=47 && str[i]!=str[j]))
      { s1=0; return false; break; }
    }
        if(s1==1)
        {
            for(i=0;str[i]!='\0';i++);
                if(str[i-2]>=42 && str[i-2]<=47)
                    { s2=0; return false; }
        }
        if(s2==1)
        {
            for(i=0;str[i]!=')' && str[i]!='(' && str[i]!='\0'; i++);
            if(str[i]==')') { s3=0; return false; }
            if(s3==1)
            {
                for(i=strlen(str);str[i]!=')' && str[i]!='(' && i>=0;i--);
                if(str[i]=='(') { s4=0; return false; }
            }
        }
    }
        else return false;
        if(s1==s2==s3==s4==1)
        return true;
}


void calculator::evaluate()//通过优先级进行计算
{
    i=0;
    j=0;
    newc=0;
    int xpoint=1;//
    start,node,end=0;
    double integer,shu1,shu2;
    char array[100],symbol;
    for(i=0;str[i]!='\0';i++)
    {
        if(str[i]>=65 && str[i]<=122) continue;
            else if((str[i]>=48 && str[i]<=57)|| str[i]=='#') { array[newc++]=str[i]; continue; }//没有遇到#的时候继续入栈
      else if(str[i]==46 && xpoint==1)
      {
          xpoint=0;
        array[newc++]=46;
        if(str[i+1]!=46)
        xpoint=1;
        continue;
        }

      else if(str[i]==46 && xpoint==0)
      {
          if(str[i+1]!=46) xpoint=1;
        continue;
        }
        else
        {
        array[newc++]=str[i];
        continue;
        }
    }
        array[newc]='\0';
        optr.push('#');
        for(i=0;array[i]!='\0';i++)
    {
        if(isdigit(array[i]))
        {
            node=0; integer=0; start=i;
			for(;isdigit(array[i])!=0 || array[i]=='.';i++)
			{ if(array[i]=='.') node=i; }
			if(node==0)
			{
			    for(j=start;j<i;j++)
				integer=(array[j]-48)*pow(10,i-1-j)+integer;
				opnd.push(integer);
            }
			else
			{
			    for(j=start;j<i;j++)
                {
                    if(j<node) integer=(array[j]-48)*pow(10,node-1-j)+integer;
                        else if(j>node) integer=(array[j]-48)*pow(10,node-j)+integer;
                }
                opnd.push(integer);
            }
				i--;
            }
				 else
            {
            while(1)
                {
                    if(lp(array[i])>rp(optr.top())) { optr.push(array[i]); break; }
                        else if(lp(array[i])==rp(optr.top()))
                        { optr.pop();break; }
                    else if(lp(array[i])<rp(optr.top()))
                    {
                    symbol=optr.top();optr.pop();
                    shu1=opnd.top();opnd.pop();
                    shu2=opnd.top();opnd.pop();
                    opnd.push(operate(symbol,shu1,shu2));
                    }
			   else if(array[i]=='#' && optr.top()=='#') { end=1; break; }
                }
            }
		if(end==1) break; }
	cout<<opnd.top()<<endl;
}


int main()
{
    calculator C;
    while(1)
    {if(C.clear())
        C.evaluate();
    else printf("Input Error!");
    }//不知道为什么写了中文就没办法输出正常的文字
    return 0;
}
