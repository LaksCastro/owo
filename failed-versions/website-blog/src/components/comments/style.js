import styled from "styled-components"
import media from "styled-media-query"

export const CommentsWrapper = styled.section`
  margin: auto;
  max-width: 70rem;
  padding: 3rem 6.4rem 3rem;

  ${media.lessThan("large")`
    padding: 3rem 1.4rem 0;
    max-width: 100%;
  `}

  iframe[src*='ads-iframe'] {
    display: none;
  }

  #disqus_thread {
    a {
      color: var(--color-text-hight) !important;
    }
  }
`

export const CommentsTitle = styled.h2`
  font-size: 2.1rem;
  font-weight: 700;
  padding: 2.5rem 0;
  color: var(--color-text-item-hight);
  text-align: center;
  display: block;
  
  ${media.lessThan("large")`
    font-size: 1.375rem;
  `}
`
