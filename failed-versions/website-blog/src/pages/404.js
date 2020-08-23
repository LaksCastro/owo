import React from "react"

import Layout from "../components/layout/layout"
import SEO from "../components/seo"

import getTheme from "../utils/getTheme"

import { Error } from "styled-icons/material/Error"

import AniLink from "gatsby-plugin-transition-link/AniLink"

import styled from "styled-components"

const ErrorWrapper = styled.div`
  padding: 3rem;
`
const ErrorContainer = styled.div`
  position: relative;
  padding: 2rem;
  background: var(--color-one);


  border-radius: 18px;

  p{
    color: var(--color-text-three);
    padding: 2rem 0;
  }
`
const ErrorIconBox = styled.div`
  position: absolute;
  
  right: -20px;
  top: -20px;

  transform: rotate(-45grad);
  width: 90px;
  height: 90px;

  color: var(--color-text-item-hight);
`

const GoBack = styled(AniLink)`
  text-align: center;
  padding: 24px;
  background: var(--color-three);
  display: block;
  border-radius: 18px;
  font-weight: bold;

  color: var(--color-text-three);
  &:hover{
    background: var(--color-text-item-hight);
    color: var(--color-two);
  }
`
const ErrorNumbers = styled.h1`
  text-align: center;
  padding-botom: 3rem;
  font-size: 8em;
  color: var(--color-text-item-hight);
  &::after{
    content: "4";
    color: var(--color-text-hight);
  }
`
const NotFoundPage = () => (
  <Layout>
    <SEO
      title="404 | Not Found"
    />
    <ErrorWrapper>
      <ErrorContainer>
        <ErrorIconBox>
          <Error />
        </ErrorIconBox>

        <ErrorNumbers>
          40
        </ErrorNumbers>
        
        <h1>Calma Jovem</h1>
        <p>Nos desculpe, procuramos por toda parte, restauramos a lixeira, reviramos as pastas ocultas, viajamos no tempo, porém tudo que achamos foi um microondas com uma banana dentro...</p>

        <GoBack paintDrip color={getTheme()} duration={1} to="/">Ir para a página inicial</GoBack>


      </ErrorContainer>
    </ErrorWrapper>
  </Layout>
)

export default NotFoundPage
