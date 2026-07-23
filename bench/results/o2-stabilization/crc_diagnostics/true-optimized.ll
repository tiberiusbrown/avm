; ModuleID = 'bench/c/crc16.c'
source_filename = "bench/c/crc16.c"
target datalayout = "e-m:e-p:16:8-p1:24:8-i8:8-i16:8-i32:8-i64:8-f16:8-f32:8-n8:16-S8-P1-G0-A0"
target triple = "avm-unknown-arduboyfx"

@data = internal unnamed_addr global [128 x i8] zeroinitializer, align 1
@crc_result = internal global i16 0, align 1

; Function Attrs: nofree norecurse nounwind
define dso_local noundef i16 @avm_test_main() local_unnamed_addr addrspace(1) #0 {
  br label %2

1:                                                ; preds = %2
  tail call addrspace(1) void @llvm.avm.debug.break()
  br label %10

2:                                                ; preds = %0, %2
  %3 = phi i16 [ 0, %0 ], [ %8, %2 ]
  %4 = trunc nuw nsw i16 %3 to i8
  %5 = mul i8 %4, 29
  %6 = add i8 %5, 17
  %7 = getelementptr inbounds nuw i8, ptr @data, i16 %3
  store i8 %6, ptr %7, align 1, !tbaa !6
  %8 = add nuw nsw i16 %3, 1
  %9 = icmp eq i16 %8, 128
  br i1 %9, label %1, label %2, !llvm.loop !7

10:                                               ; preds = %1, %14
  %11 = phi i8 [ 0, %1 ], [ %15, %14 ]
  %12 = phi i16 [ -1, %1 ], [ %56, %14 ]
  br label %17

13:                                               ; preds = %14
  store volatile i16 %56, ptr @crc_result, align 1, !tbaa !2
  tail call addrspace(1) void @llvm.avm.debug.break()
  ret i16 0

14:                                               ; preds = %17
  %15 = add nuw nsw i8 %11, 1
  %16 = icmp eq i8 %15, 8
  br i1 %16, label %13, label %10, !llvm.loop !9

17:                                               ; preds = %10, %17
  %18 = phi i16 [ 0, %10 ], [ %57, %17 ]
  %19 = phi i16 [ %12, %10 ], [ %56, %17 ]
  %20 = getelementptr inbounds nuw i8, ptr @data, i16 %18
  %21 = load i8, ptr %20, align 1, !tbaa !6
  %22 = zext i8 %21 to i16
  %23 = shl nuw i16 %22, 8
  %24 = xor i16 %23, %19
  %25 = shl i16 %24, 1
  %26 = xor i16 %25, 4129
  %27 = icmp slt i16 %24, 0
  %28 = select i1 %27, i16 %26, i16 %25
  %29 = shl i16 %28, 1
  %30 = xor i16 %29, 4129
  %31 = icmp slt i16 %28, 0
  %32 = select i1 %31, i16 %30, i16 %29
  %33 = shl i16 %32, 1
  %34 = xor i16 %33, 4129
  %35 = icmp slt i16 %32, 0
  %36 = select i1 %35, i16 %34, i16 %33
  %37 = shl i16 %36, 1
  %38 = xor i16 %37, 4129
  %39 = icmp slt i16 %36, 0
  %40 = select i1 %39, i16 %38, i16 %37
  %41 = shl i16 %40, 1
  %42 = xor i16 %41, 4129
  %43 = icmp slt i16 %40, 0
  %44 = select i1 %43, i16 %42, i16 %41
  %45 = shl i16 %44, 1
  %46 = xor i16 %45, 4129
  %47 = icmp slt i16 %44, 0
  %48 = select i1 %47, i16 %46, i16 %45
  %49 = shl i16 %48, 1
  %50 = xor i16 %49, 4129
  %51 = icmp slt i16 %48, 0
  %52 = select i1 %51, i16 %50, i16 %49
  %53 = shl i16 %52, 1
  %54 = xor i16 %53, 4129
  %55 = icmp slt i16 %52, 0
  %56 = select i1 %55, i16 %54, i16 %53
  %57 = add nuw nsw i16 %18, 1
  %58 = icmp eq i16 %57, 128
  br i1 %58, label %14, label %17, !llvm.loop !10
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn
declare void @llvm.avm.debug.break() addrspace(1) #1

attributes #0 = { nofree norecurse nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="avm1" "tune-cpu"="avm-interpreter-32u4-v1" }
attributes #1 = { mustprogress nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!llvm.errno.tbaa = !{!2}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{!"clang version 22.1.8 (https://github.com/tiberiusbrown/llvm-project.git bfb537da7b0898514c500f193b67bbeaec224903)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!4, !4, i64 0}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
