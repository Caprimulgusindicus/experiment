#include<stdio.h>
#include <malloc.h>
#include<iostream>
#include<stdio.h>
#define LEN sizeof(struct stack)
using namespace std;
bool flag=1;//判定是否能走
int N;
struct stack//构建所需要的栈
{
    int row;
    int col;
    int dir;
    struct stack *next;
    struct stack *pre;
};
struct  stack*head = (struct stack*)malloc(LEN);
struct stack*q=head;

void pop()//弹栈操作
{
    struct stack *temp;
    temp=q->pre;
    free(q);
    q=temp;
}

void push(int i,int j,int v)//压栈操作
{
    struct stack *p=(struct stack*)malloc(LEN);
    p->row=i;
    p->col=j;
    p->dir=v;
    q->next=p;
    p->pre=q;
    q=p;
}


////搜索路径
void dfs()
{
    int x,y,v=0;
    int i,j;
    int countt=0;
    int move[8][2]={2,1,1,2,1,-2,2,-1,-2,1,-1,2,-1,-2,-2,-1};   //八个方向
    int c[N][N];

     printf("input x:");   //确定起始位置
     scanf("%d",&x);
     x-=1;
     printf("input y:");
     scanf("%d",&y);
     y-=1;


    for(i=0;i<N;i++)//初始化
      {
          for(j=0;j<N;j++)
            c[i][j]=0;
      }


    while(countt<N*N-1)//判断步数否走完
    {
        while(v<8)   //当个方向没走完时执行
        {
            i=x+move[v][0];
            j=y+move[v][1];
            if(i>=0&&i<=N-1&&j>=0&&j<=N-1&&c[i][j]==0)
            {
                push(x,y,v+1); //若一个位置可走，则把前一个位置及下一个要走的方向进栈
                countt++;
                c[x][y]=countt;
                x=i;
                y=j;
                v=0;
            }
            else v++;
        }
        if(v==8&&countt>=0&&countt!=N*N-1)   //8个方向全已经走过，则弹出刚进栈的那个元素
        {
            if (q->pre==NULL) break;
            x=q->row;
            y=q->col;
            v=q->dir;
            pop();

            c[x][y]=0;
            countt--;
        }
    }

       c[x][y]=N*N;//把每一个元素遍历一遍，看是否符合条件
        for(i=0;i<N;i++)
      {
         for(j=0;j<N;j++)
            if(c[i][j]==0) flag=0;
      }



    if(flag)
    {
    for(i=0;i<N;i++)//打印路线
    {
        for(j=0;j<N;j++)
            {
                 printf("%4d",c[i][j]);
             }
            printf("\n");
        }
}
            else
            {cout<<"no solution!"<<endl;}

}

int main()
{

        cout<<"please enter the size of the chessboard:"<<endl;
        cin>>N;
        dfs();
        cout<<endl;

 return 0;
}
