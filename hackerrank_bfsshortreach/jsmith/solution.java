import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) throws Exception {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner sn=new Scanner(System.in);
        long T=Long.parseLong(sn.nextLine());
        while(T-->0) {
            String data[]=sn.nextLine().split(" ");
            int N=Integer.parseInt(data[0]);
            int M=Integer.parseInt(data[1]);
            int distance[]=new int[N+1];

            for(int i=0;i<N+1;i++) {
                distance[i]=-1;
            }

            int init=0;
            final int wait=1;
            final int visited=2;
            int state[]=new int[N+1];
            int adj[][]=new int[N+1][N+1];

            for(int i=0;i<M;i++) {
                data=sn.nextLine().split(" ");
                adj[Integer.parseInt(data[0])][Integer.parseInt(data[1])]=1;
                adj[Integer.parseInt(data[1])][Integer.parseInt(data[0])]=1;
            }

            int S=Integer.parseInt(sn.nextLine());
            LinkedList que=new LinkedList();
            que.add(S);
            int ii=0;

            while(que.size()!=0) {
                int SS=(int)(Integer)que.remove(0);
                state[SS]=visited;
                for(int i=1;i<N+1;i++) {
                    if(adj[SS][i]==1 && state[i]==init) {
                        que.add(i);
                        state[i]=wait;
                        if(distance[SS]==-1) {
                            distance[i]=6;
                        }
                        else
                        {
                            distance[i]=distance[SS]+6;
                        }

                    }
                }
            }

            int c=0;

            for(int i=1;i<N+1;i++) {
                if(i!=S)
                System.out.print(distance[i]+" ");
            }

            if(T!=-1) {
                System.out.println();
            }
        }
    }
}
