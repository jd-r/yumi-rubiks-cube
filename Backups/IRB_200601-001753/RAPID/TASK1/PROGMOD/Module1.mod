MODULE Module1
	CONST robtarget pHome:=[[24.971763923,-202.839465162,176.64502516],[0.07106331,0.248288947,-0.660142697,0.705346883],[0,0,0,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pickCube:=[[376.766775496,-69.805089288,114.555214565],[0.693258996,-0.185986842,-0.178114343,-0.673109307],[1,-1,0,4],[-118.392955921,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget aboveCube:=[[426.254207357,-69.807230037,212.96301894],[0.648575132,-0.580206927,0.34163322,-0.35496051],[1,0,1,4],[-162.757998243,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget posToSolve:=[[426.254207357,-69.807230037,212.96301894],[0.648575132,-0.580206927,0.34163322,-0.35496051],[1,0,1,4],[-162.757998243,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget face1:=[[336.180212726,3.441901358,291.531936647],[0.906120563,0.029899768,0.42190922,-0.0066438],[1,0,0,4],[-162.757996757,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget face2:=[[287.448940812,-87.256970363,395.83076221],[0.647720689,-0.048334272,-0.302453294,-0.697598533],[0,-1,0,4],[-177.747147761,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget face3:=[[287.449714183,-73.783319603,298.091654697],[0.29886944,-0.697320945,0.649381969,0.052188274],[1,0,1,4],[-177.747150451,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget backSolvePos:=[[426.254506743,-116.705282365,212.96281799],[0.648575026,-0.580207114,0.341633295,-0.354960326],[1,0,1,4],[-162.757999407,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget backSolvePose:=[[426.254927622,-210.235279713,212.962526197],[0.64857477,-0.580207492,0.341633336,-0.354960135],[1,0,1,4],[-162.757997875,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget realPosToSolve:=[[352.176605376,-100.653674388,208.268528274],[0.531098085,-0.468722436,0.483378487,-0.514372764],[1,0,1,4],[-162.757996316,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget posToSolve2:=[[375.645423458,-100.654462746,210.914642182],[0.53109775,-0.468723047,0.483378506,-0.514372535],[1,0,1,4],[-162.757996376,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget face4:=[[330.361100068,4.444400586,255.255095174],[0.832317803,0.039463524,0.552341666,-0.024665535],[1,0,0,4],[-162.68678863,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget face6:=[[303.58293492,-109.680765697,317.634844572],[0.129110416,-0.641874856,0.733824267,-0.181188063],[1,0,-2,4],[-162.686786056,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget face5:=[[330.362428827,-109.679264893,317.635430954],[0.736460496,0.167175431,-0.113108623,-0.645666131],[1,0,0,4],[-162.686785121,9E+09,9E+09,9E+09,9E+09,9E+09]];
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
		MoveL pHome,v300,z100,Camera\WObj:=wobj0;
        
        ! Pick the cube
		MoveL pickCube,v300,fine,Camera\WObj:=Workobject_2;
        SetDO DO_CloseGripper,1; ! Close Gripper
        WaitDI DI_GripperIsClosed,1;
		MoveL aboveCube,v300,fine,Camera\WObj:=Workobject_2;
        MoveL posToSolve,v300,fine,Camera\WObj:=Workobject_2;
        SetDO DO_RightAtPos,1;
        WaitDI DI_RightPermission,1;
        SetDO DO_CloseGripper,0; ! Open Gripper
        WaitDI DI_GripperIsClosed,0;
        MoveL backSolvePose,v300,fine,Camera\WObj:=Workobject_2;
        SetDO DO_RightAtPos,0;
        
        ! Wait until it left has looked at three faces
        WaitDI DI_RightPermission,0; 
        MoveL posToSolve2,v300,fine,Camera\WObj:=Workobject_2;
        SetDO DO_CloseGripper,1; ! Close Gripper
        WaitDI DI_GripperIsClosed,1;
        SetDO DO_RightAtPos,1;
        
        ! Look at the next three faces
        WaitDI DI_RightPermission,1;
        MoveL face4,v80,fine,Camera\WObj:=Workobject_2;
        MoveL face5,v100,fine,Camera\WObj:=Workobject_2;
        MoveL face6,v30,fine,Camera\WObj:=Workobject_2;
        MoveL posToSolve2,v80,fine,Camera\WObj:=Workobject_2;
        SetDO DO_RightAtPos,0;
        
        ! Solve the Cube
        
        ! Drop the cube
        !MoveL pickCube,v300,fine,Camera\WObj:=Workobject_2;
        !SetDO DO_CloseGripper,0;
        !WaitDI DI_GripperIsClosed,0;
        
        ! Move to Home Position
        !MoveL pHome,v300,z100,Camera\WObj:=wobj0;
    ENDPROC
ENDMODULE