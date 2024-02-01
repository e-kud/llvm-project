; RUN: llc -mtriple=i386-unknown-unknown -global-isel -global-isel-abort=2 -verify-machineinstrs -o /dev/null %s 2>&1 | FileCheck %s

; CHECK: warning: Instruction selection used fallback path for ret_float
define float @ret_float(float %val) {
  ret float %val
}

; CHECK: warning: Instruction selection used fallback path for store_fp80
define void @store_fp80(ptr %p, x86_fp80 %val) {
  store x86_fp80 %val, ptr %p, align 4
  ret void
}
