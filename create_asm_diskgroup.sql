CREATE DISKGROUP data EXTERNAL REDUNDANCY DISK '/dev/oracleasm/asm-disk3' ATTRIBUTE 'compatible.asm' = '12.2', 'compatible.rdbms' = '12.2' ;
CREATE DISKGROUP fra  EXTERNAL REDUNDANCY DISK '/dev/oracleasm/asm-disk4' ATTRIBUTE 'compatible.asm' = '12.2', 'compatible.rdbms' = '12.2';
exit
