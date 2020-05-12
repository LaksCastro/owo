/*********************************************************
 * Testes
 */

const {
  defineTestCases,
  defineRespostas,
  pontosProximosDe,
  definePossibleStartPoints,
  defineValorDaLinha,
} = require("./grafos");

const { tdt } = require("./yeeaahtests");

function desafioTest() {
  const input = [
    "2",
    "4",
    "A1 C2",
    "B3 C3",
    "C4 C2",
    "C2 D2",
    "2",
    "A1 A5",
    "E1 E5",
  ];

  // console.assert(JSON.stringify(input)==JSON.stringify(interpretaInput('test.txt')), `${JSON.stringify(input)}==${JSON.stringify(interpretaInput('test.txt'))}`)

  const testCases = defineTestCases(input);
  console.assert(testCases.length === 2, `${testCases.length} === 2`);
  console.assert(testCases[0].length === 4, `${testCases[0].length} === 4`);
  console.assert(testCases[1].length === 2, `${testCases[1].length} === 2`);

  const respostas = defineRespostas(testCases);
  console.assert(respostas.length === 2, `${respostas.length} === 2`);
  console.assert(respostas[0] === 8.24, `${respostas[0]} === 8.24`);
  console.assert(respostas[1] === "~x(", `${respostas[1]} === ~x(`);
}

function TDD() {
  desafioTest();

  tdt(defineValorDaLinha, [
    ["A1", "A2", 1],
    ["A1", "A3", 2],
    ["A1", "B1", 1],
    ["A1", "C1", 2],
  ]);

  tdt(definePossibleStartPoints, [
    [
      ["A1", "C2", "D2", "C4", "B3", "C3"],
      ["A1", "D2", "C4", "B3"],
    ],
    [
      ["A1", "A2", "A3"],
      ["A1", "A3"],
    ],
  ]);

  tdt(pontosProximosDe, [
    ["A1", ["A2", "B1", "B2"]],
    ["D3", ["C2", "C3", "C4", "D4", "E4", "E3", "E2", "D2"]],
  ]);

  tdt(pontosProximosDe, [
    ["A1", ["A2", "B1", "B2"]],
    ["D3", ["C2", "C3", "C4", "D4", "E4", "E3", "E2", "D2"]],
  ]);
}

TDD();
