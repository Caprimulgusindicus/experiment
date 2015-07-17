#include <iostream>
#include <cstdlib>
#include <cstring>
#include <vector>
using namespace std;

const int maxnumber = 20;

class graph
{
    public:
     graph(string a[],int dingdian,int bian);   //对类成员的初始化
     void DFSTraverse(int v);   //深度遍历
     void BFSTraverse(int v);   //宽度遍历
     void DFS_lujing(int v1,int v2,int k);   //在深度遍历的基础上找长度为k的所有可达路径
    private:
      string vertex_cunfang[maxnumber];   //存放顶点的数据
      int bianzhi[maxnumber][maxnumber];   //有关系的两点所连边的长度值
      int last[maxnumber]; //顶点数据
      int dianshu; //点数
      int bianshu; //边数
      int fangwen[maxnumber];  //判断是否被访问
      int length[maxnumber+1];  //边的长度值
      vector<int> p[maxnumber];   //利用vector向量存储两点之间的关系
};
//构造函数graph
graph::graph(string a[],int dingdian,int bian)
{
    memset(last,-1,sizeof(last));   //last数组的初始值为-1
    dianshu = dingdian;
    bianshu = bian;
    for(int i=0;i<dianshu;i++)
    {
        vertex_cunfang[i] = a[i];
        fangwen[i] = 0;
    }
    for(int m=0;m<dianshu;m++)
    {
        for(int j=0;j<bianshu;j++)
        {
            bianzhi[m][j] = 0;      //把所有两点之间的边均初始为零
        }

    }
    for(int k=0;k<bianshu;k++)
        {
            int x,y;
            cout<<"输入边的两个顶点和路径长度：";
            cin>>x>>y>>length[k];
            bianzhi[x][y] = length[k];   //两个点之间的存在边的长度
            bianzhi[y][x] = length[k];
            p[x].push_back(y);   //确定两点的关系
            p[y].push_back(x);
        }
}
//深度遍历优先遍历
void graph::DFSTraverse(int v)
{
    cout<<vertex_cunfang[v]<< " ";    //输出访问的第一个点
    fangwen[v] = 1;                  //标记被访问的点
    for (int i=0;i<p[v].size();i++)    //根据v点与其他点的关系，进行进一步的深度遍历
    {
        if(fangwen[p[v][i]]==0)
            DFSTraverse(p[v][i]);
    }
}

//图的宽度遍历
void graph::BFSTraverse(int v)
{
    int front,rear;    //定义图顶和图尾
    front = rear = 0;
    int data[maxnumber];   //重新定义一个整形数组，存储点
    for(int i=0;i<dianshu;i++)
    {
        fangwen[i] = 0;
    }
    cout<<vertex_cunfang[v]<<" ";
    fangwen[v]=1;
    data[++rear] = v;    //将已访问的v赋给data[1]
    while(front!=rear)
    {
        int i;
        i = data[++front];   //将data[1]赋值给i
        for (int k=0;k<p[i].size();k++)   //根据点v与其他点的连接情况
        {
            if(fangwen[p[i][k]]==0)    //如果没有访问
            {
                cout<<vertex_cunfang[p[i][k]]<<" ";  //输出被访问的该点
                fangwen[p[i][k]] = 1;  //并标记为已访问
                data[++rear] = p[i][k];  //将输出的该点赋值给data[++rear]
            }
        }
    }
    memset(fangwen,0,sizeof(fangwen));   //将访问数组初始化为0
}
//图利用深度遍历找固定长度的所有路径
void  graph::DFS_lujing(int v1,int v2,int k)
{

    if(v1==v2)    //当两点相同时
    {
        if(k==0)     //且k为0
        {
            int p=v2;   //定义p赋值v2
                cout << p;  //输出p
                p=last[p];   //记录p的前一个连接点
            while (p>=0)   //如果该点大于等于0
            {
                cout << "->" << p;  //输出该点
                p=last[p];    //存储该点的前一个点
            }
            cout << endl;

        }
        else ;
    }
    else   //两点不相同
    {

        fangwen[v1]=1;  //标记为已访问
        for (int i=0;i<p[v1].size();i++)
        {
             if(fangwen[p[v1][i]]==0)
             {
                 last[p[v1][i]]=v1;   //将v1赋给last数组，作为前连接点
                DFS_lujing(p[v1][i],v2,k-bianzhi[v1][p[v1][i]]);  //利用递归找到其路径
            }
        }
        fangwen[v1]=0;
    }
}


int main()
{
    int dian;
    int bian;
    string a[15] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14"};
    cout<<"输入顶点的个数:";
    cin>>dian;
    cout<<"输入边的个数:";
    cin>>bian;
    graph G(a,dian,bian);
    cout<<"深度优先遍历:"<<endl;
    G.DFSTraverse(0);
    cout<<endl;
    cout<<"宽度优先遍历:"<<endl;
    G.BFSTraverse(0);
    cout<<endl;
    int V1,V2,K;
    cout<<"输入V1，V2，K值："<<endl;
    cin>>V1>>V2>>K;
    G.DFS_lujing(V2,V1,K);
    return 0;
}
