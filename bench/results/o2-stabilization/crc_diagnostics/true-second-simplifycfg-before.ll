; *** IR Dump Before SimplifyCFGPass on avm_test_main ***
; Function Attrs: nounwind
define dso_local i16 @avm_test_main() local_unnamed_addr addrspace(1) #0 {
  br label %1
1:                                                ; preds = %5, %0
  %2 = phi i16 [ 0, %0 ], [ %10, %5 ]
  %3 = icmp samesign ult i16 %2, 128
  br i1 %3, label %5, label %4
4:                                                ; preds = %1
  call addrspace(1) void @llvm.avm.debug.break()
  br label %11
5:                                                ; preds = %1
  %6 = trunc nuw i16 %2 to i8
  %7 = mul i8 %6, 29
  %8 = add i8 %7, 17
  %9 = getelementptr inbounds nuw i8, ptr @data, i16 %2
  store i8 %8, ptr %9, align 1, !tbaa !6
  %10 = add nuw nsw i16 %2, 1
  br label %1, !llvm.loop !7
11:                                               ; preds = %21, %4
  %12 = phi i16 [ -1, %4 ], [ %18, %21 ]
  %13 = phi i8 [ 0, %4 ], [ %22, %21 ]
  %14 = icmp samesign ult i8 %13, 8
  br i1 %14, label %16, label %15
15:                                               ; preds = %11
  store volatile i16 %12, ptr @crc_result, align 1, !tbaa !2
  call addrspace(1) void @llvm.avm.debug.break()
  ret i16 0
16:                                               ; preds = %11
  br label %17
17:                                               ; preds = %33, %16
  %18 = phi i16 [ %12, %16 ], [ %30, %33 ]
  %19 = phi i16 [ 0, %16 ], [ %34, %33 ]
  %20 = icmp samesign ult i16 %19, 128
  br i1 %20, label %23, label %21
21:                                               ; preds = %17
  %22 = add nuw nsw i8 %13, 1
  br label %11, !llvm.loop !9
23:                                               ; preds = %17
  %24 = getelementptr inbounds nuw i8, ptr @data, i16 %19
  %25 = load i8, ptr %24, align 1, !tbaa !6
  %26 = zext i8 %25 to i16
  %27 = shl nuw i16 %26, 8
  %28 = xor i16 %18, %27
  br label %29
29:                                               ; preds = %42, %23
  %30 = phi i16 [ %28, %23 ], [ %43, %42 ]
  %31 = phi i8 [ 0, %23 ], [ %44, %42 ]
  %32 = icmp samesign ult i8 %31, 8
  br i1 %32, label %35, label %33
33:                                               ; preds = %29
  %34 = add nuw nsw i16 %19, 1
  br label %17, !llvm.loop !10
35:                                               ; preds = %29
  %36 = icmp sgt i16 %30, -1
  br i1 %36, label %40, label %37
37:                                               ; preds = %35
  %38 = shl i16 %30, 1
  %39 = xor i16 %38, 4129
  br label %42
40:                                               ; preds = %35
  %41 = shl nuw i16 %30, 1
  br label %42
42:                                               ; preds = %40, %37
  %43 = phi i16 [ %39, %37 ], [ %41, %40 ]
  %44 = add nuw nsw i8 %31, 1
  br label %29, !llvm.loop !11
}
