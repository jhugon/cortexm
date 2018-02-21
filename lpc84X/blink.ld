MEMORY {
    rom (rx) : ORIGIN = 0x0, LENGTH = 64K
    ram (rwx) : ORIGIN = 0x10000000, LENGTH = 16K
}

SECTIONS
{
    .text : { *(.text*) } > rom
}

