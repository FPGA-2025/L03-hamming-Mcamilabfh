if [ -z "$1" ]; then
    echo "Erro: É preciso especificar o número do teste"
    exit 1
fi

# Conta quantas linhas tem o teste atual
QTD=$(wc -l < test/teste$1.txt)
QTD_MINUS_ONE=$((QTD - 1))

# Gera o tb.v com vetor do tamanho certo
QTD_MINUS_ONE=$QTD_MINUS_ONE ./gen_tb.sh $QTD

iverilog -o tb tb.v calcula_hamming.v injetor.v corrige_hamming.v

rm -f saida.out
cp test/teste$1.txt teste.txt
./tb > saida.out
cp saida.out test/saida$1.out
cp saida.vcd test/saida$1.vcd
rm saida.out saida.vcd teste.txt

if cmp -s test/saida$1.out test/saida$1.ok; then
    echo "OK"
    exit 0
else
    echo "ERRO"
    exit 1
fi
