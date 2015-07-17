#include <iostream>
#include <cstdlib>
#include <cstring>
#include <vector>
using namespace std;

const int maxnumber = 20;

class graph
{
    public:
     graph(string a[],int dingdian,int bian);   //�����Ա�ĳ�ʼ��
     void DFSTraverse(int v);   //��ȱ���
     void BFSTraverse(int v);   //��ȱ���
     void DFS_lujing(int v1,int v2,int k);   //����ȱ����Ļ������ҳ���Ϊk�����пɴ�·��
    private:
      string vertex_cunfang[maxnumber];   //��Ŷ��������
      int bianzhi[maxnumber][maxnumber];   //�й�ϵ�����������ߵĳ���ֵ
      int last[maxnumber]; //��������
      int dianshu; //����
      int bianshu; //����
      int fangwen[maxnumber];  //�ж��Ƿ񱻷���
      int length[maxnumber+1];  //�ߵĳ���ֵ
      vector<int> p[maxnumber];   //����vector�����洢����֮��Ĺ�ϵ
};
//���캯��graph
graph::graph(string a[],int dingdian,int bian)
{
    memset(last,-1,sizeof(last));   //last����ĳ�ʼֵΪ-1
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
            bianzhi[m][j] = 0;      //����������֮��ı߾���ʼΪ��
        }

    }
    for(int k=0;k<bianshu;k++)
        {
            int x,y;
            cout<<"����ߵ����������·�����ȣ�";
            cin>>x>>y>>length[k];
            bianzhi[x][y] = length[k];   //������֮��Ĵ��ڱߵĳ���
            bianzhi[y][x] = length[k];
            p[x].push_back(y);   //ȷ������Ĺ�ϵ
            p[y].push_back(x);
        }
}
//��ȱ������ȱ���
void graph::DFSTraverse(int v)
{
    cout<<vertex_cunfang[v]<< " ";    //������ʵĵ�һ����
    fangwen[v] = 1;                  //��Ǳ����ʵĵ�
    for (int i=0;i<p[v].size();i++)    //����v����������Ĺ�ϵ�����н�һ������ȱ���
    {
        if(fangwen[p[v][i]]==0)
            DFSTraverse(p[v][i]);
    }
}

//ͼ�Ŀ�ȱ���
void graph::BFSTraverse(int v)
{
    int front,rear;    //����ͼ����ͼβ
    front = rear = 0;
    int data[maxnumber];   //���¶���һ���������飬�洢��
    for(int i=0;i<dianshu;i++)
    {
        fangwen[i] = 0;
    }
    cout<<vertex_cunfang[v]<<" ";
    fangwen[v]=1;
    data[++rear] = v;    //���ѷ��ʵ�v����data[1]
    while(front!=rear)
    {
        int i;
        i = data[++front];   //��data[1]��ֵ��i
        for (int k=0;k<p[i].size();k++)   //���ݵ�v����������������
        {
            if(fangwen[p[i][k]]==0)    //���û�з���
            {
                cout<<vertex_cunfang[p[i][k]]<<" ";  //��������ʵĸõ�
                fangwen[p[i][k]] = 1;  //�����Ϊ�ѷ���
                data[++rear] = p[i][k];  //������ĸõ㸳ֵ��data[++rear]
            }
        }
    }
    memset(fangwen,0,sizeof(fangwen));   //�����������ʼ��Ϊ0
}
//ͼ������ȱ����ҹ̶����ȵ�����·��
void  graph::DFS_lujing(int v1,int v2,int k)
{

    if(v1==v2)    //��������ͬʱ
    {
        if(k==0)     //��kΪ0
        {
            int p=v2;   //����p��ֵv2
                cout << p;  //���p
                p=last[p];   //��¼p��ǰһ�����ӵ�
            while (p>=0)   //����õ���ڵ���0
            {
                cout << "->" << p;  //����õ�
                p=last[p];    //�洢�õ��ǰһ����
            }
            cout << endl;

        }
        else ;
    }
    else   //���㲻��ͬ
    {

        fangwen[v1]=1;  //���Ϊ�ѷ���
        for (int i=0;i<p[v1].size();i++)
        {
             if(fangwen[p[v1][i]]==0)
             {
                 last[p[v1][i]]=v1;   //��v1����last���飬��Ϊǰ���ӵ�
                DFS_lujing(p[v1][i],v2,k-bianzhi[v1][p[v1][i]]);  //���õݹ��ҵ���·��
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
    cout<<"���붥��ĸ���:";
    cin>>dian;
    cout<<"����ߵĸ���:";
    cin>>bian;
    graph G(a,dian,bian);
    cout<<"������ȱ���:"<<endl;
    G.DFSTraverse(0);
    cout<<endl;
    cout<<"������ȱ���:"<<endl;
    G.BFSTraverse(0);
    cout<<endl;
    int V1,V2,K;
    cout<<"����V1��V2��Kֵ��"<<endl;
    cin>>V1>>V2>>K;
    G.DFS_lujing(V2,V1,K);
    return 0;
}
