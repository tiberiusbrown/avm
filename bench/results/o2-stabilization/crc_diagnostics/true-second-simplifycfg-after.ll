; *** IR Dump After SimplifyCFGPass on avm_test_main ***
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
11:                                               ; preds = %20, %4
  %12 = phi i16 [ -1, %4 ], [ %17, %20 ]
  %13 = phi i8 [ 0, %4 ], [ %21, %20 ]
  %14 = icmp samesign ult i8 %13, 8
  br i1 %14, label %16, label %15
15:                                               ; preds = %11
  store volatile i16 %12, ptr @crc_result, align 1, !tbaa !2
  call addrspace(1) void @llvm.avm.debug.break()
  ret i16 0
16:                                               ; preds = %11, %32
  %17 = phi i16 [ %29, %32 ], [ %12, %11 ]
  %18 = phi i16 [ %33, %32 ], [ 0, %11 ]
  %19 = icmp samesign ult i16 %18, 128
  br i1 %19, label %22, label %20
20:                                               ; preds = %16
  %21 = add nuw nsw i8 %13, 1
  br label %11, !llvm.loop !9
22:                                               ; preds = %16
  %23 = getelementptr inbounds nuw i8, ptr @data, i16 %18
  %24 = load i8, ptr %23, align 1, !tbaa !6
  %25 = zext i8 %24 to i16
  %26 = shl nuw i16 %25, 8
  %27 = xor i16 %17, %26
  br label %28
28:                                               ; preds = %41, %22
  %29 = phi i16 [ %27, %22 ], [ %42, %41 ]
  %30 = phi i8 [ 0, %22 ], [ %43, %41 ]
  %31 = icmp samesign ult i8 %30, 8
  br i1 %31, label %34, label %32
32:                                               ; preds = %28
  %33 = add nuw nsw i16 %18, 1
  br label %16, !llvm.loop !10
34:                                               ; preds = %28
  %35 = icmp sgt i16 %29, -1
  br i1 %35, label %39, label %36
36:                                               ; preds = %34
  %37 = shl i16 %29, 1
  %38 = xor i16 %37, 4129
  br label %41
39:                                               ; preds = %34
  %40 = shl nuw i16 %29, 1
  br label %41
41:                                               ; preds = %39, %36
  %42 = phi i16 [ %38, %36 ], [ %40, %39 ]
  %43 = add nuw nsw i8 %30, 1
  br label %28, !llvm.loop !11
}
