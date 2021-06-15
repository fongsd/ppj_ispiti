#include <iostream>
#include <cstdlib>
#include <cstring>
#include <string>

using namespace std;

int main()
{
    string *s = new string();
    cin>>*s;
    cout<<*s<<endl;
    int i = s->length();
    while (i) 
    {
        cout<<s->back()<<endl;
        s->pop_back();
        i--;
    }
//     
    return 0;
}
