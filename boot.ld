OUTPUT_FORMAT(binary)
ENTRY(_start)
SECTIONS
{
    /* 1. Set the starting address for the code */
    . = 0x7c00;

    /* 2. Place the code section */
    .text :
    {
        *(.text)
    }

    /* 3. CRITICAL: Throw away all the extra metadata sections that cause the bloat */
    /DISCARD/ :
    {
        *(.note*)
        *(.comment*)
        *(.eh_frame*)
        *(.debug*)
    }
}
