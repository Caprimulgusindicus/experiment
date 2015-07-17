#include <iostream>
#include <cstdlib>
#include <cstring>
#include <vector>
using namespace std;
const int Max=20;

//顶点是vertex，边是edge
class graph
{
public:
    graph(string a[],int vertex,int edge);
    void DFS(int v);//深度优先搜索
    void DFS_road(int v1,int v2,int k);//深度优先搜索的路径
    void BFS(int v);//广度优先搜索
private:
    string vertex_save[Max];//存放顶点
    int edge_value[Max][Max];//两点所连边的长度
    int last[Max];//顶点数据
    int vnumber;
    int enumber;
    int visited[Max];
    int length[Max+1];
    vector<int> p[Max];//用向量存储两点间的关系

};

graph::graph(string a[],int vertex,int edge)
{
    memset(last,-1,sizeof(last));//初始化
    vnumber=vertex;
    enumber=edge;
    for(int i=0;i<vnumber;i++)
    {
        vertex_save[i]=a[i];
        visited[i]=0;
        for(int j=0;j>enumber;j++)
            edge_value[i][j]=0;
    }
    for(int k=0;k<enumber;k++)
    {
        int x,y,m;
        m=k+1;
        cout<<"输入第"<<m<<"条边的两个顶点以及边长";
        cin>>x>>y>>length[k];//输入两点间的长度
        edge_value[x][y]=length[k];
        edge_value[y][x]=length[k];//建立邻接矩阵
        p[x].push_back(y);
        p[y].push_back(x);
    }
}

void graph::DFS(int v)
{
    cout<<vertex_save[v]<<" ";//输出访问的第一个顶点
    visited[v]=1;//标记顶点
    for(int i=0;i<p[v].size();i++)//递归遍历
    {
        if(visited[p[v][i]]==0)
            DFS(p[v][i]);
    }
}

void graph::BFS(int v)
{
    int front,rear;
    front=rear=0;//定义顶层和尾层
    int data[Max];
    for(int i=0;i<vnumber;i++) visited[i]=0;
    cout<<vertex_save[v]<<" ";
    visited[v]=1;//输出信息后把标识改了
    data [++rear]=v;//将已经访问的赋给data[1]
    while(front!=rear)
    {
        int i;
        i = data[++front];   //将data[1]赋值给i
        for (int k=0;k<p[i].size();k++)   //根据点v与其他点的连接情况
        {
            if(visited[p[i][k]]==0)
            {
                cout<<vertex_save[p[i][k]]<<" ";  //输出被访问的该点
                visited[p[i][k]] = 1;  //并标记为已访问
                data[++rear] = p[i][k];  //将输出的该点赋值给data[++rear]
            }
        }
    }
    memset(visited,0,sizeof(visited));   //清零

}

void graph::DFS_road(int v1,int v2,int k)
{
    if(v1==v2)  //当两点相同时
    {
        if(k==0) //k=0时
        {
            int p=v2;cout<<p;p=last[p]; //输出p并记录p的前一个连接点
            while(p>=0)
            {
                cout<<"->"<<p;p=last[p];//输出并存储前一个连接点
            }
            cout<<endl;
        }
        else ;
    }
    else //两点不同
    {
        visited[v1]=1; //标记为已经访问
        for(int i=0;i<p[v1].size();i++)
        {
            if(visited[p[v1][i]]==0)
            {
                last[p[v1][i]]=v1;DFS_road(p[v1][i],v2,k-edge_value[v1][p[v1][i]]);
            }
        }
        visited[v1]=0;
    }
}
int main()
{
    int vertex;
    int edge;
    while(1)
    {
    string a[15] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14"};
    cout<<"输入顶点的个数:";
    cin>>vertex;
    cout<<"输入边的个数:";
    cin>>edge;
    graph G(a,vertex,edge);
    cout<<"深度优先遍历:"<<endl;
    G.DFS(0);
    cout<<endl;
    cout<<"广度优先遍历:"<<endl;
    G.BFS(0);
    cout<<endl;
    int V1,V2,K;
    cout<<"输入V1，V2，K值："<<endl;
    cin>>V1>>V2>>K;
    G.DFS_road(V2,V1,K);
    cout<<endl;
    }
    return 0;
}
