import React from "react"
import PropTypes from "prop-types"

import GlobalStyle from "../../reset/reset"

import Aside from "../aside/aside"
import NavBar from "../navBar/navBar"

import { TransitionPortal } from "gatsby-plugin-transition-link"

import * as S from "./style"

const Layout = ({ children }) => {
  return (
    <S.LayoutWrapper>
      <GlobalStyle />
      <TransitionPortal level="top">
        <Aside />
      </TransitionPortal>
  
      <S.Main>{children}</S.Main>
  
      <TransitionPortal level="top">
        <NavBar />
      </TransitionPortal>
    </S.LayoutWrapper>
  )
}

Layout.propTypes = {
  children: PropTypes.node.isRequired,
}

export default Layout
