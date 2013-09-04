$fn=70;
con=25.4;
wall=.125;
legs=.5;
x=93;
y=25.4;

module body(){
	translate([0,0,legs]*con){
		difference(){
			union(){
				translate([-wall,0,0]*con){
					cube([3+wall*2,1+wall*2,3+wall*2]*con);
				}
				translate([-wall,.5+wall,0]*con){
					cylinder(r=(1+wall*2)/2*con,h=(3+wall*2)*con);
				}
			}
			translate([-wall,.5+wall,wall]*con){
				cylinder(r=((1+wall*2)/2-wall)*con,h=4*con);
			}
			translate([0,wall,wall]*con){
				cube([3,1,4]*con);
			}
		}
		translate([0,0,0]*con){
			cube([wall,((1+wall*2)/2)*2,(3+wall*2)]*con);
		}
	}
	difference(){
		translate([3,0,0]*con){
			rotate([0,-10,0]){
				cube([1,1+wall*2,(4)]*con);
			}
		}
		translate([0,-1,wall]*con){
			cube([3,4,4]*con);
		}
		translate([0,-1,0]*con){
			cube([5,3,legs]*con);
		}
		translate([0,-1,legs+3+wall*2]*con){
			cube([5,3,3]*con);
		}
	}
}

module leg(){
	translate([-.12,0,0]*con){
		cube([.12,wall*2,legs]*con);
	}
	intersection(){
		translate([0,0,0]*con){
			cube([legs,wall*2,legs]*con);
		}
		translate([1.6,0,-6.34]){
			rotate([0,-25,0]){
				cube([legs,wall*2,legs*4]*con);
			}
		}
	}
}

module legs(x,y){
	translate([0,0,0]*con){
		leg();
	}
	translate([x,0,0]){
		leg();
	}
	translate([0,y,0]){
		leg();
	}
	translate([x,y,0]){
		leg();
	}
}

module head(){
	translate([90,0,120]){
		rotate([0,10,0]){
			intersection(){
				translate([0,0,0]*con){
					cube([.5,wall*2+1,.5*4]*con);
				}
				translate([1.6,0,-6.34]){
					rotate([0,-25,0]){
						cube([.5,wall*2+1,.5*4]*con);
					}
				}
			}
			translate([20,0,0]){
				rotate([0,10,0]){
					mirror(){
						intersection(){
							translate([0,0,-1]){
								cube([.5,wall*2+1,.5*4]*con);
							}
							translate([1.6,0,-6.34]){
								rotate([0,-27,0]){
									cube([.5,wall*2+1,.5*4]*con);
								}
							}
						}
					}
				}
			}
			translate([20,0,0]){
				rotate([0,130,0]){
						difference(){
							cube([.5,wall*2+1,.5*2]*con);
							translate([6.5,100,30]){
								rotate([90,180,0]){
									linear_extrude(height=200){
										polygon(
											points=[[0,25],[-10,-20],[10,-20]],
											paths=[[0,1,2]]
										);
									}
								}
							}
						}
					translate([2,(wall+.5)*con,25]){
						rotate([90,0,0]){
							cylinder(r=4,h=(wall*2+1)*con,center=true);
						}
					}
					translate([11,(wall+.5)*con,25]){
						rotate([90,0,0]){
							cylinder(r=4,h=(wall*2+1)*con,center=true);
						}
					}
				}
			}
			difference(){
				union(){
					translate([0,0,-48]){
						cube([.78,(wall*2+1),2]*con);
					}
					translate([-8.7,0,-30]){
						rotate([0,20,0]){
							cube([.5,(wall*2+1),1.2]*con);
						}
					}
				}
				translate([33,0,-50]){
					rotate([90,-10,0]){
						resize([2*con,4*con,4*con]){
							cylinder(r=25.4,h=(3)*con,center=true);
						}
					}
				}
			}
		}
	}
}
module modified(){
	difference(){
		translate([.75,0,0]*con){
			head();
		}
		translate([.75,0,0]*con){
			body();
		}
		
	}
}


translate([0,-100,0]){
	rotate([90,0,90]){
		modified();
	}
}

legs(30,y);












