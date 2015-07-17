#include <iostream>
#include <cstdlib>
#include <cstring>
#include <vector>
using namespace std;
const int Max=20;

//������vertex������edge
class graph
{
public:
    graph(string a[],int vertex,int edge);
    void DFS(int v);//�����������
    void DFS_road(int v1,int v2,int k);//�������������·��
    void BFS(int v);//�����������
private:
    string vertex_save[Max];//��Ŷ���
    int edge_value[Max][Max];//���������ߵĳ���
    int last[Max];//��������
    int vnumber;
    int enumber;
    int visited[Max];
    int length[Max+1];
    vector<int> p[Max];//�������洢�����Ĺ�ϵ

};

graph::graph(string a[],int vertex,int edge)
{
    memset(last,-1,sizeof(last));//��ʼ��
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
        cout<<"�����"<<m<<"���ߵ����������Լ��߳�";
        cin>>x>>y>>length[k];//���������ĳ���
        edge_value[x][y]=length[k];
        edge_value[y][x]=length[k];//�����ڽӾ���
        p[x].push_back(y);
        p[y].push_back(x);
    }
}

void graph::DFS(int v)
{
    cout<<vertex_save[v]<<" ";//������ʵĵ�һ������
    visited[v]=1;//��Ƕ���
    for(int i=0;i<p[v].size();i++)//�ݹ����
    {
        if(visited[p[v][i]]==0)
            DFS(p[v][i]);
    }
}

void graph::BFS(int v)
{
    int front,rear;
    front=rear=0;//���嶥���β��
    int data[Max];
    for(int i=0;i<vnumber;i++) visited[i]=0;
    cout<<vertex_save[v]<<" ";
    visited[v]=1;//�����Ϣ��ѱ�ʶ����
    data [++rear]=v;//���Ѿ����ʵĸ���data[1]
    while(front!=rear)
    {
        int i;
        i = data[++front];   //��data[1]��ֵ��i
        for (int k=0;k<p[i].size();k++)   //���ݵ�v����������������
        {
            if(visited[p[i][k]]==0)
            {
                cout<<vertex_save[p[i][k]]<<" ";  //��������ʵĸõ�
                visited[p[i][k]] = 1;  //�����Ϊ�ѷ���
                data[++rear] = p[i][k];  //������ĸõ㸳ֵ��data[++rear]
            }
        }
    }
    memset(visited,0,sizeof(visited));   //����

}

void graph::DFS_road(int v1,int v2,int k)
{
    if(v1==v2)  //��������ͬʱ
    {
        if(k==0) //k=0ʱ
        {
            int p=v2;cout<<p;p=last[p]; //���p����¼p��ǰһ�����ӵ�
            while(p>=0)
            {
                cout<<"->"<<p;p=last[p];//������洢ǰһ�����ӵ�
            }
            cout<<endl;
        }
        else ;
    }
    else //���㲻ͬ
    {
        visited[v1]=1; //���Ϊ�Ѿ�����
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
    cout<<"���붥��ĸ���:";
    cin>>vertex;
    cout<<"����ߵĸ���:";
    cin>>edge;
    graph G(a,vertex,edge);
    cout<<"������ȱ���:"<<endl;
    G.DFS(0);
    cout<<endl;
    cout<<"������ȱ���:"<<endl;
    G.BFS(0);
    cout<<endl;
    int V1,V2,K;
    cout<<"����V1��V2��Kֵ��"<<endl;
    cin>>V1>>V2>>K;
    G.DFS_road(V2,V1,K);
    cout<<endl;
    }
    return 0;
}
