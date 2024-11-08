import SwiftUI

struct ContentView: View {
    @State private var valorEmUSD: String = ""
    @State private var moedaDestino: String = "EUR"
    @State private var resultado: String = ""
    
    let taxasDeCambio: [String: Double] = [
        "EUR": 0.85,
        "BRL": 5.0,
        "GBP": 0.76
    ]
    
    var body: some View {
        VStack {
            Text("Conversor de Moedas")
                .font(.largeTitle)
                .padding()
            
            TextField("Valor em USD", text: $valorEmUSD)
        
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.green, lineWidth: 1)
                )
                .padding()
            
            Picker("Moeda de destino", selection: $moedaDestino) {
                Text("EUR").tag("EUR")
                Text("BRL").tag("BRL")
                Text("GBP").tag("GBP")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button(action: converterMoeda) {
                Text("Converter")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding()
            
            Text(resultado)
                .font(.title2)
                .padding()
        }
        .padding()
    }
    
    func converterMoeda() {
        guard let valor = Double(valorEmUSD) else {
            resultado = "Valor inválido"
            return
        }
        
        let taxa = taxasDeCambio[moedaDestino] ?? 1.0
        let valorConvertido = valor * taxa
        
        resultado = String(format: "%.2f USD = %.2f %@", valor, valorConvertido, moedaDestino)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
