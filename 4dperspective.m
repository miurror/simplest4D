(* ::Package:: *)

(* ::Input::Initialization:: *)
name="StanfordBunny";
points=ExampleData[{"Geometry3D",name},"VertexData"];
poly=ExampleData[{"Geometry3D",name}, "PolygonData"];
points4D=Table[Append[points[[j]],1],{j,Length[points]}];

Rotation4[Rxw_,Rxy_,Rxz_,Ryz_,Ryw_,Rzw_]:=
\!\(\*
TagBox[
RowBox[{"(", "", GridBox[{
{
RowBox[{"Cos", "[", "Rxw", "]"}], "0", "0", 
RowBox[{"-", 
RowBox[{"Sin", "[", "Rxw", "]"}]}]},
{"0", "1", "0", "0"},
{"0", "0", "1", "0"},
{
RowBox[{"Sin", "[", "Rxw", "]"}], "0", "0", 
RowBox[{"Cos", "[", "Rxw", "]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, "RowsIndexed" -> {}, "Items" -> {}, "ItemsIndexed" -> {}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}, "RowsIndexed" -> {}, "Items" -> {}, "ItemsIndexed" -> {}}], "", ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\).({
 {Cos[Rxy], -Sin[Rxy], 0, 0},
 {Sin[Rxy], Cos[Rxy], 0, 0},
 {0, 0, 1, 0},
 {0, 0, 0, 1}
}).({
 {Cos[Rxz], 0, -Sin[Rxz], 0},
 {0, 1, 0, 0},
 {Sin[Rxz], 0, Cos[Rxz], 0},
 {0, 0, 0, 1}
}).\!\(\*
TagBox[
RowBox[{
RowBox[{"(", "", GridBox[{
{"1", "0", "0", "0"},
{"0", 
RowBox[{"Cos", "[", "Ryz", "]"}], 
RowBox[{"-", 
RowBox[{"Sin", "[", "Ryz", "]"}]}], "0"},
{"0", 
RowBox[{"Sin", "[", "Ryz", "]"}], 
RowBox[{"Cos", "[", "Ryz", "]"}], "0"},
{"0", "0", "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, "RowsIndexed" -> {}, "Items" -> {}, "ItemsIndexed" -> {}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}, "RowsIndexed" -> {}, "Items" -> {}, "ItemsIndexed" -> {}}], "", ")"}], ".", 
RowBox[{"(", "", GridBox[{
{"1", "0", "0", "0"},
{"0", 
RowBox[{"Cos", "[", "Ryw", "]"}], "0", 
RowBox[{"-", 
RowBox[{"Sin", "[", "Ryw", "]"}]}]},
{"0", "0", "1", "0"},
{"0", 
RowBox[{"Sin", "[", "Ryw", "]"}], "0", 
RowBox[{"Cos", "[", "Ryw", "]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, "RowsIndexed" -> {}, "Items" -> {}, "ItemsIndexed" -> {}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}, "RowsIndexed" -> {}, "Items" -> {}, "ItemsIndexed" -> {}}], "", ")"}]}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\).\!\(\*
TagBox[
RowBox[{"(", "", GridBox[{
{"1", "0", "0", "0"},
{"0", "1", "0", "0"},
{"0", "0", 
RowBox[{"Cos", "[", "Rzw", "]"}], 
RowBox[{"-", 
RowBox[{"Sin", "[", "Rzw", "]"}]}]},
{"0", "0", 
RowBox[{"Sin", "[", "Rzw", "]"}], 
RowBox[{"Cos", "[", "Rzw", "]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, "RowsIndexed" -> {}, "Items" -> {}, "ItemsIndexed" -> {}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}, "RowsIndexed" -> {}, "Items" -> {}, "ItemsIndexed" -> {}}], "", ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
\[Lambda]={1,1,1,1};
Xm={0,0,0,0};
Xc={0,0,-1,-10};
Rc= Rotation4[0,0,0,0,0,0];
Near=1;Far=10;a=1;fovy=2Pi/3;
V=Append[Transpose[Append[IdentityMatrix[4],-Rc.Xc]],{0,0,0,0,1}].Append[Transpose[Append[Rc,{0,0,0,0}]],{0,0,0,0,1}];
P=Append[Append[Transpose[Join[DiagonalMatrix[{-(1/(a Tan[fovy/2])),-(1/Tan[fovy/2]),-(1/Tan[fovy/2])}],Table[Table[0,{i,3}],{j,2}]]],{0,0,0,Far/(Far-Near),(Far*Near)/(Far-Near)}],{0,0,0,1,0}];
M=Append[Transpose[Append[IdentityMatrix[4],Xm]],{0,0,0,0,1}].Append[Transpose[Append[Transpose[Rm],{0,0,0,0}]],{0,0,0,0,1}].DiagonalMatrix[Append[\[Lambda],1]];
pers4[vector_]:=Module[{temp},temp=P.V.M.Append[vector,1];Delete[temp/temp[[-1]],-1]];
list=Table[Rm=Rotation4[(t Pi)/50,0,Pi,0,(4 Pi)/5,0];
M=Append[Transpose[Append[IdentityMatrix[4],Xm]],{0,0,0,0,1}].Append[Transpose[Append[Transpose[Rm],{0,0,0,0}]],{0,0,0,0,1}].DiagonalMatrix[Append[\[Lambda],1]];
pers4[vector_]:=Module[{temp},temp=P.V.M.Append[vector,1];Delete[temp/temp[[-1]],-1]];
newPoints=Table[temp=pers4[points4D[[j]]];Delete[temp/temp[[-1]],-1],{j,Length[points]}];
Graphics3D[{EdgeForm[],GraphicsComplex[newPoints,{Polygon[poly]}]},Boxed->False],{t,50}];
ListAnimate[list]
