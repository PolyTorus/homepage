'use client'
import { extendTheme } from '@yamada-ui/react'

export const theme = extendTheme({
  styles: {
    global: {
      body: {
        bg: '#1A1D1F',
        color: 'white',
      },
    },
  },
  colors: {
    brand: {
      sidebar: '#32373C',
      main: '#1A1D1F',
    },
  },
  components: {
    Box: {
      baseStyle: {
        _dark: {
          color: 'white',
        }
      }
    },
    Heading: {
      baseStyle: {
        _dark: {
          color: 'white',
        }
      }
    },
    Text: {
      baseStyle: {
        _dark: {
          color: 'white',
        }
      }
    },
    Icon: {
      sizes: {
        md: {
          boxSize: '1.5rem', // 24px
        },
        lg: {
          boxSize: '2rem',  // 32px
        }
      },
      defaultProps: {
        size: 'lg'
      }
    },
    Link: {
      baseStyle: {
        _hover: {
          textDecoration: 'none',
        }
      }
    }
  }
}) 