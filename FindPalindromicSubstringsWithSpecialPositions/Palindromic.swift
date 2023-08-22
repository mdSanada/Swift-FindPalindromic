//
//  findPalindromicSubstringsWithSpecialPositions.swift
//  FindPalindromicSubstringsWithSpecialPositions
//
//  Created by Matheus Sanada on 22/08/23.
//

import Foundation

struct Palindromic {
    // Gera uma matriz de palíndromos a partir da string de entrada.
    private func generatePalindromeMatrix(_ s: String) -> [[Int]] {
        // Calcula o tamanho da string.
        let n = s.count
        // Inicializa uma matriz dp preenchida com zeros.
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        /*
         [
             [0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0]
         ]
         */
        // Preenche a diagonal principal da matriz com 1, indicando palíndromos de tamanho 1.
        for i in 0..<n {
            dp[i][i] = 1
        }
        /*
         [
             [1, 0, 0, 0, 0, 0, 0],
             [0, 1, 0, 0, 0, 0, 0],
             [0, 0, 1, 0, 0, 0, 0],
             [0, 0, 0, 1, 0, 0, 0],
             [0, 0, 0, 0, 1, 0, 0],
             [0, 0, 0, 0, 0, 1, 0],
             [0, 0, 0, 0, 0, 0, 1]
         ]
         */

        // Converte a string em um array de caracteres.
        let chars = Array(s)

        // Preenche a matriz dp usando programação dinâmica para identificar palíndromos de tamanhos maiores.
        for length in 2...n {
            for i in 0..<n - length + 1 {
                let j = i + length - 1
                // Verifica se os caracteres nos índices i e j são iguais.
                if chars[i] == chars[j] {
                    // Se forem iguais, atualiza o valor na matriz dp.
                    dp[i][j] = dp[i + 1][j - 1] + 2
                } else {
                    // Se não forem iguais, escolhe o valor máximo entre os dois vizinhos na matriz dp.
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
            }
        }
        // Retorna a matriz dp preenchida.
        return dp
        /*
         [
             [1, 1, 1, 3, 3, 5, 5],
             [0, 1, 1, 3, 3, 5, 5],
             [0, 0, 1, 1, 3, 3, 3],
             [0, 0, 0, 1, 1, 3, 3],
             [0, 0, 0, 0, 1, 1, 1],
             [0, 0, 0, 0, 0, 1, 1],
             [0, 0, 0, 0, 0, 0, 1]
         ]
         */
    }

    // Constrói palíndromos a partir da matriz de palíndromos dp, retornando os índices dos caracteres.
    private func buildPalindromes(_ dp: [[Int]], _ chars: [Character], _ i: Int, _ j: Int) -> [Int] {
        // Se o índice inicial for maior que o índice final, retorna um array vazio.
        if i > j {
            return []
        }

        // Se o índice inicial for igual ao índice final, retorna um array com um único índice.
        if i == j {
            return [i]
        }

        // Verifica se os caracteres nos índices i e j são iguais e se o valor em dp[i][j] indica um palíndromo.
        // dp[i + 1][j - 1] = Ve a celula na diagonal (esquerda, abaixo)
        // dp[i][j] == dp[i + 1][j - 1] + 2 compara se é palíndromo
        if chars[i] == chars[j] && dp[i][j] == dp[i + 1][j - 1] + 2 {
            // Se sim, chama recursivamente a função e concatena os índices obtidos com os índices i e j.
            // Nesse caso, a função entra nessa condição e chama recursivamente a si mesma, mas agora com o intervalo reduzido para os caracteres internos do palíndromo. Ou seja, a chamada será buildPalindromes(dp, chars, i + 1, j - 1).
            // Ao atingir um dos casos (i > j) ou (i == j) a função termina a recursão retornando os indíces do palíndromo.
            let innerIndices = buildPalindromes(dp, chars, i + 1, j - 1)
            return [i] + innerIndices + [j]
        } else {
            // Se não, compara os valores dp[i+1][j] e dp[i][j-1].
            let nextI = dp[i + 1][j]
            let prevJ = dp[i][j - 1]
            
            // Escolhe o próximo índice a ser incluído no palíndromo com base nos valores da matriz dp.
            if nextI >= prevJ {
                return buildPalindromes(dp, chars, i + 1, j)
            } else {
                return buildPalindromes(dp, chars, i, j - 1)
            }
        }
    }

    // Conta o número de ocorrências de um valor em um array.
    private func countOccurrences(of value: Int, in array: [Int]) -> Int {
        return array.reduce(0) { $1 == value ? $0 + 1 : $0 }
    }

    // Encontra o array que melhor combina com o array de alvo, considerando o maior número de ocorrências e tamanho.
    private func matchArray(targetArray: [Int], arrays: [[Int]]) -> [Int]? {
        // Inicializa variáveis para acompanhar o número máximo de ocorrências e o tamanho máximo.
        var maxOccurrences = 0
        var maxCount = 0
        // Inicializa o array que contém as ocorrências máximas.
        var arrayWithMostOccurrences: [Int]? = nil
        // Corrige as posições especiais para serem base 0, respeitando formato de index padrão.
        let fixTarget = targetArray.map { $0 - 1}
        
        // Itera sobre os arrays para encontrar o array com mais ocorrências especiais.
        for array in arrays {
            // Inicializa a variável para contar as ocorrências.
            var occurrences = 0

            // Itera sobre as posições especiais corrigidas.
            for target in fixTarget {
                // Se o array contiver a posição especial, incrementa o contador de ocorrências.
                if array.contains (target) {
                    occurrences += 1
                }
            }
            
            // Compara o número de ocorrências com o máximo atual e o tamanho do array com o tamanho máximo.
            if occurrences > maxOccurrences || (occurrences == maxOccurrences && array.count > maxCount) {
                // Atualiza os valores máximos e o array com as ocorrências máximas.
                maxOccurrences = occurrences
                maxCount = array.count
                arrayWithMostOccurrences = array
            }

        }
        
        // Retorna o array com as ocorrências máximas ou nulo se não houver correspondência.
        return arrayWithMostOccurrences
    }

    // Função principal que encontra o palíndromo com o maior número de índices especiais.
    func find(_ str: String, special positions: [Int]) -> Int {
        // Gera a matriz de palíndromos a partir da string de entrada.
        let matrix = generatePalindromeMatrix(str)
        var temp:[[Int]] = []
        
        // Constrói uma lista de palíndromos para cada índice da string.
        for index in 0..<str.count {
            let build = buildPalindromes(matrix, Array(str), 0, index)
            temp.append(build)
        }
        
        // Encontra o palíndromo que melhor combina com as posições especiais fornecidas.
        let specialPosition = matchArray(targetArray: positions, arrays: temp)

        // Retorna o número de índices especiais no palíndromo encontrado ou 1 se não houver correspondência.
        return specialPosition?.count ?? 1
    }

}
