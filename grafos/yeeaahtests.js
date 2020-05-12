function expect(funcaoTestada) {
  let resultadoRetornado = funcaoTestada; // armazena retorno da funcao

  return {
    toBe: function (resultadoEsperado) {
      console.assert(
        resultadoRetornado === resultadoEsperado,
        `${resultadoRetornado} (retornado) === ${resultadoEsperado} (esperado)`
      );
    },
    toBeArray: function (resultadoEsperado) {
      if (!resultadoRetornado) throw new Error("O retorno está está undefined");
      if (
        !Array.isArray(resultadoRetornado) ||
        !Array.isArray(resultadoEsperado)
      )
        throw new Error("O retorno não é um array");

      // Serve para verificar se 2 arrays são iguais independente da ordem
      let valid = true;

      resultadoRetornado.map((retorno) => {
        if (!valid) return;

        // Ve se o retorno existe no arraclsy esperado
        if (resultadoEsperado.includes(retorno)) {
          // Pega o index do elemento retornado no array esperado
          const index = resultadoEsperado.indexOf(retorno);

          // ele tira esse elemento do array esperado
          resultadoEsperado[index] = undefined;

          // e depois remove todos os elementos undefined;
          resultadoEsperado.filter((item) => !!item);
        } else {
          valid = false;
        }
      });

      // resultado

      // se valid = true, os array são iguais

      console.assert(
        valid,
        `${resultadoRetornado} (retornado) === ${resultadoEsperado} (esperado)`
      );
    },
  };
}

// TableDrivenTests
// https://github.com/larien/learn-go-with-tests/blob/master/primeiros-passos-com-go/estruturas-metodos-e-interfaces/estruturas-metodos-e-interfaces.md#refatora%C3%A7%C3%A3o-adicional
// https://living-sun.com/pt/go/276907-test-naming-conventions-in-golang-go.html
// https://github.com/golang/go/wiki/TableDrivenTests
function tdt(funcaoTestada, tabelaDeTestes) {
  tabelaDeTestes.map((parametros) => {
    let resultadoEsperado = parametros.pop();
    if (Array.isArray(resultadoEsperado)) {
      expect(funcaoTestada(...parametros)).toBeArray(resultadoEsperado);
    } else {
      expect(funcaoTestada(...parametros)).toBe(resultadoEsperado);
    }
  });
}

module.exports = {
  tdt,
};
