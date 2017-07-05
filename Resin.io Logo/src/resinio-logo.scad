/*
	resinCut: The resin.io logo cut diagonally so that it can lay on a wall and look similar to the image version.

	PARAMETERS
		edge: <Number> The length of the edge of the logo's cube.
		depth: <Number ∈ [0, 100]>
*/
module resinCut(edge = 20, depth = 100) {
	module resinLogo() {
		color([247/255, 195/255, 15/255]) {
			// Main cube
			difference() {
				cube(size = [100, 100, 100], center = false);
				translate([-35, -35, 35]) cube(size = [100, 100, 100], center = false);
			}

			// Inner cube
			translate([15, 15, 35]) cube(size = [50, 50, 50], center = false);
		}
	}

	depth = (depth > 100)? 100 : ((depth < 0)? 0 : depth);
	echo(depth);

	a = 200 - depth;
	b = 100 - a;
	vert = [
		[a, b, b],
		[b, a, b],
		[a, a, b],
		[a, a, a],
	];

	face = [
		[0, 2, 1],
		[0, 3, 2],
		[1, 2, 3],
		[0, 1, 3],
	];

	scale(edge / 100)
	translate([-50, -50, 0])
	difference() {
		resinLogo();
		polyhedron(vert, face);
	}
}

resinCut();
