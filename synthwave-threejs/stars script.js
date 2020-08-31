const width = 300;
const height = 300;

const initialX = -(width / 2);
const initialZ = -(height / 2);
const y = 0;

const linesLength = 51;
const verticalLinesLength = 51;

const maxZ = height / 2;
const maxX = width / 2;

const length = 20;

let stars = [];

function randomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}

function pos(x, y, z, velocity, size) {
	return { x, y, z, velocity, size };	
}


function getRandomPosition() {
	const x = initialX;
	const y = randomInt(0, height);
	const z = initialZ;
	const velocity = randomInt(80, 150);
	const size = randomInt(1, 8);
	
	return pos(x, y, z, velocity, size);
}

function update(event) {
	for(let i = 0; i < scene.children.length; i++) {
		if(scene.children[i].type === "Points") {
			scene.remove(scene.children[i]);
			i--;
		}
	}
	
	for(let i = 0; i < length; i++) {
		const aux = stars[i];
		
		if(aux !== undefined) {			
			const dotGeometry = new THREE.Geometry();
			
			let position = {
				size: aux.position.size,
				velocity: aux.position.velocity,
				x: aux.position.x + aux.position.velocity / 100,
				y: aux.position.y - aux.position.velocity / 100,
				z: aux.position.z,
			};

			if(position.x > maxX || position.y < -10) {
				position = getRandomPosition();
			}
			
			dotGeometry.vertices.push(new THREE.Vector3(position.x, position.y, position.z));

			const dotMaterial = new THREE.PointsMaterial({ size: position.size, sizeAttenuation: false, color: 0xF7121F });
			
			const dot = new THREE.Points(dotGeometry, dotMaterial);
			
			stars[i] = { dot, position };
					
			this.add(stars[i].dot);	
			
			continue;
		}
		
		const dotGeometry = new THREE.Geometry();
		
		const position = getRandomPosition();
		
		dotGeometry.vertices.push(new THREE.Vector3(position.x, position.y, position.z));
	
		const dotMaterial = new THREE.PointsMaterial({ size: position.size, sizeAttenuation: false });
	
		const dot = new THREE.Points(dotGeometry, dotMaterial);
		
		stars.push({ dot, position });
		
		this.add(stars[i].dot);	
	}
	
	renderer.render(scene, camera);
}
