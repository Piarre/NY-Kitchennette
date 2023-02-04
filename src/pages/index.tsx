import Head from "next/head";
import Image from "next/image";
import { Inter } from "@next/font/google";
import styles from "~/styles/Home.module.css";

import prisma from "~/lib/prisma";
import { GetStaticProps } from "next";

export default function Home() {
  return <></>;
}

export const getStaticProps: GetStaticProps = async () => {
  const feed = await prisma.post.findMany({
    where: { published: true },
    include: {
      author: {
        select: { name: true },
      },
    },
  });
  return {
    props: { feed },
    revalidate: 10,
  };
};
