#include<stdio.h>
#include <malloc.h>
#include<iostream>
#include<stdio.h>
#define LEN sizeof(struct stack)
using namespace std;
bool flag=1;//�ж��Ƿ�����
int N;
struct stack//��������Ҫ��ջ
{
    int row;
    int col;
    int dir;
    struct stack *next;
    struct stack *pre;
};
struct  stack*head = (struct stack*)malloc(LEN);
struct stack*q=head;

void pop()//��ջ����
{
    struct stack *temp;
    temp=q->pre;
    free(q);
    q=temp;
}

void push(int i,int j,int v)//ѹջ����
{
    struct stack *p=(struct stack*)malloc(LEN);
    p->row=i;
    p->col=j;
    p->dir=v;
    q->next=p;
    p->pre=q;
    q=p;
}


////����·��
void dfs()
{
    int x,y,v=0;
    int i,j;
    int countt=0;
    int move[8][2]={2,1,1,2,1,-2,2,-1,-2,1,-1,2,-1,-2,-2,-1};   //�˸�����
    int c[N][N];

     printf("input x:");   //ȷ����ʼλ��
     scanf("%d",&x);
     x-=1;
     printf("input y:");
     scanf("%d",&y);
     y-=1;


    for(i=0;i<N;i++)//��ʼ��
      {
          for(j=0;j<N;j++)
            c[i][j]=0;
      }


    while(countt<N*N-1)//�жϲ���������
    {
        while(v<8)   //��������û����ʱִ��
        {
            i=x+move[v][0];
            j=y+move[v][1];
            if(i>=0&&i<=N-1&&j>=0&&j<=N-1&&c[i][j]==0)
            {
                push(x,y,v+1); //��һ��λ�ÿ��ߣ����ǰһ��λ�ü���һ��Ҫ�ߵķ����ջ
                countt++;
                c[x][y]=countt;
                x=i;
                y=j;
                v=0;
            }
            else v++;
        }
        if(v==8&&countt>=0&&countt!=N*N-1)   //8������ȫ�Ѿ��߹����򵯳��ս�ջ���Ǹ�Ԫ��
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

       c[x][y]=N*N;//��ÿһ��Ԫ�ر���һ�飬���Ƿ��������
        for(i=0;i<N;i++)
      {
         for(j=0;j<N;j++)
            if(c[i][j]==0) flag=0;
      }



    if(flag)
    {
    for(i=0;i<N;i++)//��ӡ·��
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
