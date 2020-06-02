MODULE Module1
	CONST robtarget pHomeL:=[[10.457496534,148.132867885,176.35475559],[0.248288947,0.07106331,-0.705346883,0.660142697],[0,0,0,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget posToSolveL:=[[330.588726687,88.996694067,244.663346065],[0.666138699,-0.028237347,-0.019784056,0.745030521],[-1,1,-2,4],[106.437512435,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget face1:=[[297.108765245,33.934637119,244.662410778],[0.535895442,-0.568456493,0.421408825,0.460530013],[-1,0,-2,4],[106.437553404,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget face2:=[[297.109440488,90.733841,310.176728249],[0.771903759,-0.111646776,-0.117222446,0.614783281],[-1,1,-2,4],[106.437564975,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget face3:=[[297.10981702,90.73431925,310.176563128],[0.217827049,0.59473309,0.749751947,0.191614055],[0,-1,-3,4],[-159.430070068,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget posToSolveL_2:=[[330.588726687,88.996694067,244.663346065],[0.666138699,-0.028237347,-0.019784056,0.745030521],[-1,1,-2,4],[106.437512435,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget backPosToSolve:=[[330.589050351,304.441694714,244.663279056],[0.666138818,-0.028237032,-0.019784093,0.745030426],[-1,1,-2,4],[106.437510753,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !***********************************************************
    !
    ! Module:  Module1
    !
    ! Description:
    !   <Insert description here>
    !
    ! Author: pcruiher08
    !
    ! Version: 1.0
    !
    !***********************************************************
    
    
    !***********************************************************
    !
    ! Procedure main
    !
    !   This is the entry point of your program
    !
    !***********************************************************
    PROC main()
        ! Move to Home Position
		MoveL pHomeL,v300,z100,Camera\WObj:=wobj0;
        
        ! Move to where the cube is
        WaitDI DI_LeftPermission,1;
        MoveL posToSolveL,v300,fine,Camera\WObj:=Workobject_3;
        SetDO DO_CloseGripperL,1; ! Close Gripper
        WaitDO DO_CloseGripperL,1;
        SetDO DO_LeftAtPos,1;
        
        ! Take picture to the first three faces
        WaitDI DI_LeftPermission,0;
        MoveL face1,v60,fine,Camera\WObj:=Workobject_3;
        MoveL face3,v60,fine,Camera\WObj:=Workobject_3;
        MoveL face2,v60,fine,Camera\WObj:=Workobject_3;
        MoveL posToSolveL,v100,fine,Camera\WObj:=Workobject_3;
        SetDO DO_LeftATPos,0; 
        WaitDI DI_LeftPermission,1; ! Wait until right is in place to hold it
        SetDO DO_CloseGripperL,0; ! Open Gripper
        WaitDO DO_CloseGripperL,0;
        MoveL backPosToSolve,v300,fine,Camera\WObj:=Workobject_3;
        SetDO DO_LeftATPos,1;
        
        ! Wait until right has looked at the next three faces
        WaitDI DI_LeftPermission,0;
        MoveL posToSolveL,v300,fine,Camera\WObj:=Workobject_3;
        
        
        ! Solve the cube
        
        ! Move to Home Position
		!MoveL pHomeL,v300,z100,Camera\WObj:=wobj0;
    ENDPROC
ENDMODULE