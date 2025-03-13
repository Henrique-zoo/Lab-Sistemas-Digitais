#include <bits/stdc++.h>

using namespace std;

string converte(int a) {
    if (a < 2)
        return to_string(a);
    return converte(a/2) + to_string((a % 2));
}

void descobreMinTermos(string binario) {
    int t = binario.length();
    queue<string> fila;
    fila.push(binario);
    vector<string> todosOsBinarios;
    unordered_set<string> bin;

    while(!fila.empty()) {
        string binario = fila.front();
        fila.pop();
        bool completo = true;
        for (int i = 0; i < t; ++i) {
            if (binario[i] == '-') {
                string aux = binario;
                aux[i] = '1';
                fila.push(aux);
                aux[i] = '0';
                fila.push(aux);
                completo = false;
            }
        }
        if (completo && (!bin.count(binario))) {
            todosOsBinarios.push_back(binario);
            bin.insert(binario);
        }
    }

    for (string& binario : todosOsBinarios) {
        reverse(binario.begin(), binario.end());
        int decimal = 0;
        for (int i = 0; i < t; i++)
            decimal += (binario[i] - '0') * pow(2, i);
        cout << decimal << " ";   
    }
    cout << endl;
}

int main() {

    while (true) {
        int op;
        cout << "Escolha o que voce quer fazer:\n";
        cout << "1. Converter decimal para binario\n";
        cout << "2. Ver quais linhas da tabela-verdade um termo binario liga\n";
        cin >> op;
        switch (op) {
        case 1: {
            int n;
            cin >> n;
            cout << converte(n) << endl;
            break;
        }
        case 2: {
            string binario;
            cin >> binario;
            descobreMinTermos(binario);
            break;
        }
        default:
            cout << "Opção inválida\n";
            return 0;
        }
    }
    return 0;
}