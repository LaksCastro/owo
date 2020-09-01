const width = 100;
const height = 100;

const initialX = -(width / 2);
const initialZ = -(height / 2);
const y = 0;

const linesLength = 51;
const verticalLinesLength = 51;

const maxZ = height / 2;
const maxX = width / 2;

const margin = width / linesLength;
const verticalMargin = height / verticalLinesLength;

let lines = [];
let verticalLines = [];

function pos(x, y, z) {
	return { x, y, z };	
}

function update( event ) {	
	for(let i = 0; i < scene.children.length; i++) {
		if(scene.children[i].type === "Line") {
			scene.remove(scene.children[i]);
			i--;
		}
	}
	
	for(let i = 0; i <= verticalLinesLength; i++) {
		const finalX = maxX;
		
		if(verticalLines[i] !== undefined) {	
			const velocity = 20;
			
			const aux = verticalLines[i];
			
			const points = [];

			const color = 0xff0000;
			
			const x = aux.startPos.x;
			const y = aux.startPos.y;
			let z = aux.startPos.z + velocity / 100;
			
			if(z > maxZ) {
				z = initialZ;
			}
			
			points.push(new THREE.Vector3(x, y, z));
			points.push(new THREE.Vector3(finalX, y, z));

			const material = new THREE.LineBasicMaterial({ color });
			const geometry = new THREE.BufferGeometry().setFromPoints(points);
			const line = new THREE.Line(geometry, material);

			verticalLines[i] = { line, startPos: pos(x, y, z) };
			
			this.add(verticalLines[i].line);
			
			continue;
		}
		
		const x = initialX;
		
		const z = i * verticalMargin + initialZ;

		const points = [];
		
		const color = 0xff0000;
		
		points.push(new THREE.Vector3(x, y, z));
		points.push(new THREE.Vector3(finalX, y, z));

		const material = new THREE.LineBasicMaterial({ color });
		const geometry = new THREE.BufferGeometry().setFromPoints(points);
		const line = new THREE.Line(geometry, material);
		
		verticalLines.push({ line, startPos: pos(x, y, z) });
		
		this.add(verticalLines[i].line);
	}

	for(let i = 0; i <= linesLength; i++) {	
		const x = i * margin + initialX;
		const z = initialZ;
		const finalZ = maxZ;
		
		const points = [];
		
		const color = 0xF7121F;
		
		const isLeft = i < linesLength / 2;
			
		points.push(new THREE.Vector3(x, y, z));
		points.push(new THREE.Vector3(x, y, finalZ));
				
		const material = new THREE.LineBasicMaterial({ color });
		const geometry = new THREE.BufferGeometry().setFromPoints(points);
		const line = new THREE.Line(geometry, material);

		lines.push({ line, startPos: pos(x, y, z) });
		
		this.add(lines[i].line);
	}
	
	
	renderer.render(scene, camera);
}
