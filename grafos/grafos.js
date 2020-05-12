function interpretaInput(arquivo) {
  const file = require("fs").readFileSync(arquivo, "utf8");
  const lines = file.split("\n");
  return lines.slice(0, -1);
}

function defineTestCases(input) {
  return [...Array(parseInt(input[0])).keys()].map((empty, i) => {
    const posicaoTeste = [...Array(parseInt(i)).keys()].reduce((prev, cur) => {
      // console.log("reduce", prev, cur)
      prev = parseInt(prev);
      // console.log(cur)
      // console.log({prev, cur: parseInt(input[cur])})
      return prev + parseInt(input[prev]) + 1;
    }, 1);

    const totalDeElementosTeste = parseInt(input[posicaoTeste]);
    // console.log({ posicaoTeste, totalDeElementosTeste })
    // const testCase = [...Array(parseInt(input[0+1])).keys()].map(() => [])
    const testCase = input.slice(
      posicaoTeste + 1,
      posicaoTeste + 1 + parseInt(input[posicaoTeste])
    );
    return testCase;
  });
}

function equivalenciaAlfabetica(letra) {
  const dicionario = {
    A: 1,
    B: 2,
    C: 3,
    D: 4,
    E: 5,
  };

  return dicionario[letra];
}

function defineValorDaLinha(x, y) {
  const letraOrigem = x.substr(0, 1);
  const letraDestino = y.substr(0, 1);
  // console.log({letraOrigem, letraDestino})

  const numeroOrigem = x.substr(1, 2);
  const numeroDestino = y.substr(1, 2);
  // console.log({letraOrigem, letraDestino, numeroOrigem, numeroDestino})

  const latitudeOrigem = numeroOrigem;
  const latitudeDestino = numeroDestino;

  const longitudeOrigem = equivalenciaAlfabetica(letraOrigem);
  const longitudeDestino = equivalenciaAlfabetica(letraDestino);

  const distanciaLatitude = Math.abs(latitudeOrigem - latitudeDestino);
  const distanciaLongitude = Math.abs(longitudeOrigem - longitudeDestino);
  const distanciaTotal = Math.hypot(distanciaLatitude, distanciaLongitude);
  // console.log({distanciaLatitude, distanciaLongitude, distanciaTotal})

  return distanciaTotal;
}

function defineRespostas(testCases) {
  return testCases.map((testCase) => {
    const total = testCase.reduce((total, linha) => {
      // console.log({total, linha})
      const [origem, destino] = linha.split(" ");
      // console.log({origem, destino})
      const valorLinha = defineValorDaLinha(origem, destino);
      const resultado = valorLinha + total;
      // console.log({resultado})
      //console.log({ totalAtual: total, linha, valorLinha, resultado });

      return resultado;
    }, 0);
    return total;
  });
}

function pontosProximosDe(ponto) {
  const letra = ponto.substr(0, 1);
  const numero = parseInt(ponto.substr(1, 2));

  //equivalenciaAlfabetica(letra);
  // pontos próximos de A:
  // A B
  // pontos próximos de 1
  // 1 2

  // pontos próximos de C
  // B C D
  // pontos proximos de 3
  // 2 3 4

  // Então A1 C4 E2
  const letrasProximas = {
    A: ["A", "B"],
    B: ["B", "A", "C"],
    C: ["C", "B", "D"],
    D: ["D", "C", "E"],
    E: ["E", "D"],
  };

  const pontosProximos = letrasProximas[letra]
    .map((letraProxima) => {
      if (numero === 1) {
        if (letraProxima === letra) {
          return [`${letraProxima}2`];
        }
        return [`${letraProxima}1`, `${letraProxima}2`];
      } else if (numero === 5) {
        if (letraProxima === letra) {
          return [`${letraProxima}4`];
        }
        return [`${letraProxima}5`, `${letraProxima}4`];
      } else {
        if (letraProxima === letra) {
          return [
            `${letraProxima}${numero - 1}`,
            `${letraProxima}${numero + 1}`,
          ];
        }
        return [
          `${letraProxima}${numero - 1}`,
          `${letraProxima}${numero}`,
          `${letraProxima}${numero + 1}`,
        ];
      }
    })
    .flat();

  return pontosProximos;
}

/**
 * Procura pontos nas extremidades
 */
function definePossibleStartPoints(points) {
  return points.filter((point) => {
    const pontosProximos = pontosProximosDe(point);
    const pontosProximosEncontrados = pontosProximos.filter((pontoProximo) =>
      points.includes(pontoProximo)
    );

    const naoExistePontosProximos = pontosProximosEncontrados.length < 1;

    /*
    console.log({
      ponto: points.includes(pontosProximosDe(point)),
      pontosProximos: pontosProximos,
      naoExistePontosProximos,
    });
    */

    return naoExistePontosProximos;
  });
}

module.exports = {
  defineTestCases,
  defineRespostas,
  definePossibleStartPoints,
  defineValorDaLinha,
  pontosProximosDe,
};
